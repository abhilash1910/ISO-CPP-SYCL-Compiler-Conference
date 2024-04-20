//Author Abhilash Majumder (abhilash.majumder@intel.com)
#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <torch/extension.h>
#include "utils.h"

template <typename T>
__inline__ T silu_xpu(const T& x) {
  // x * sigmoid(x)
  return (T)(((float)x) / (1.0f + sycl::exp((float)-x)));
}

template<typename T>
__inline__ T gelu_xpu(const T& x) {
  // Equivalent to PyTorch GELU with 'none' approximation.
  // Refer to:
  // https://github.com/pytorch/pytorch/blob/8ac9b20d4b090c213799e81acf48a55ea8d437d6/aten/src/ATen/native/cuda/ActivationGeluKernel.cu#L38
  const float f = (float) x;
  constexpr float ALPHA = M_SQRT1_2;
  return (T) (f * 0.5f * (1.0f + sycl::erf(f * ALPHA)));
}


template <typename scalar_t>
void silu_and_mul_kernel(
    scalar_t* __restrict__ out, // [..., d]
    const scalar_t* __restrict__ input, // [..., 2, d]
    const int d,
    const sycl::nd_item<3>& item_ct1) {
  const int64_t token_idx = item_ct1.get_group(2);
  for (int64_t idx = item_ct1.get_local_id(2); idx < d;
       idx += item_ct1.get_local_range(2)) {
    const scalar_t x = input[token_idx * 2 * d + idx];
    const scalar_t y = input[token_idx * 2 * d + d + idx];
    out[token_idx * d + idx] = silu_xpu(x) * y;
  }
}

template <typename scalar_t>
void gelu_and_mul_kernel(
    scalar_t* __restrict__ out, // [..., d]
    const scalar_t* __restrict__ input, // [..., 2, d]
    const int d,
    const sycl::nd_item<3>& item_ct1) {
  const int64_t token_idx = item_ct1.get_group(2);
  for (int64_t idx = item_ct1.get_local_id(2); idx < d;
       idx += item_ct1.get_local_range(2)) {
    const scalar_t x = input[token_idx * 2 * d + idx];
    const scalar_t y = input[token_idx * 2 * d + d + idx];
    out[token_idx * d + idx] = gelu_xpu(x) * y;
  }
}


template <typename scalar_t>
void call_silu_and_mul_kernel(
    int num_tokens,
    int d,
    const scalar_t* __restrict__ input,
    scalar_t* __restrict__ output) {
  using sycl_t = torch_sycl::sycl_::SyclTypeTrait<scalar_t>::Type;
  sycl::range<3> grid(1, 1, num_tokens);
  sycl::range<3> block(1, 1, std::min(d, 1024));
  auto& queue = torch_sycl::sycl_::sycltorchGetQueue();
  queue.submit([&](sycl::handler& cgh) {
    cgh.parallel_for(
        sycl::nd_range<3>(grid * block, block), [=](sycl::nd_item<3> item_ct1) {
          silu_and_mul_kernel<sycl_t>(
              (sycl_t*)output, (const sycl_t*)input, d, item_ct1);
        });
  });
}

template <typename scalar_t>
void call_gelu_and_mul_kernel(
    int num_tokens,
    int d,
    const scalar_t* __restrict__ input,
    scalar_t* __restrict__ output) {
  using sycl_t = torch_sycl::sycl_::SyclTypeTrait<scalar_t>::Type;
  sycl::range<3> grid(1, 1, num_tokens);
  sycl::range<3> block(1, 1, std::min(d, 1024));
  auto& queue = torch_sycl::sycl_::sycltorchGetQueue();
  queue.submit([&](sycl::handler& cgh) {
    cgh.parallel_for(
        sycl::nd_range<3>(grid * block, block), [=](sycl::nd_item<3> item_ct1) {
          gelu_and_mul_kernel<sycl_t>(
              (sycl_t*)output, (const sycl_t*)input, d, item_ct1);
        });
  });
}


void silu_and_mul(torch::Tensor& out, torch::Tensor& input) {
  int num_tokens = input.numel() / input.size(-1);
  int d = input.size(-1) / 2;

  AT_DISPATCH_FLOATING_TYPES(
      input.scalar_type(), "call_silu_and_mul_kernel", [&] {
        call_silu_and_mul_kernel(
            num_tokens,
            d,
            input.data_ptr<scalar_t>(),
            out.data_ptr<scalar_t>());
      });
}



void gelu_and_mul(
  torch::Tensor& out,      // [..., d]
  torch::Tensor& input)    // [..., 2 * d]
{
    int num_tokens = input.numel() / input.size(-1);
  int d = input.size(-1) / 2;

  AT_DISPATCH_FLOATING_TYPES(
      input.scalar_type(), "call_gelu_and_mul_kernel", [&] {
        call_gelu_and_mul_kernel(
            num_tokens,
            d,
            input.data_ptr<scalar_t>(),
            out.data_ptr<scalar_t>());
      });
}

