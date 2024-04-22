//Author Abhilash Majumder (abhilash.majumder@intel.com)

#pragma once

#include <sycl/sycl.hpp>
#include <memory>
#include <ipex.h>
#include <ATen/ATen.h>
#include <dpct/dpct.hpp>
#include <stdint.h>


namespace torch_sycl {
namespace sycl_ {

static inline sycl::queue& sycltorchGetQueue() {
  auto device_type = c10::DeviceType::XPU;
  c10::impl::VirtualGuardImpl impl(device_type);
  c10::Stream c10_stream = impl.getStream(c10::Device(device_type));
  auto& queue = ::xpu::get_queue_from_stream(c10_stream);
  return queue;
}
template <typename T>
struct SyclTypeTrait{
  using Type = T;
};

template <>
struct SyclTypeTrait<c10::Half>{
  using Type = sycl::half;
};

template <>
struct SyclTypeTrait<c10::BFloat16>{
  using Type = sycl::ext::oneapi::bfloat16;
};


} // namespace xpu

} // namespace gptq

SYCL_EXTERNAL sycl::half sycl_half_mul(sycl::half a, sycl::half b);
SYCL_EXTERNAL sycl::half sycl_half_add(sycl::half a, sycl::half b);
SYCL_EXTERNAL sycl::half sycl_half_sub(sycl::half a, sycl::half b);
SYCL_EXTERNAL sycl::half sycl_half_fma(sycl::half a, sycl::half b, sycl::half c);

SYCL_EXTERNAL sycl::half2 sycl_half_mul2(sycl::half2 a, sycl::half2 b);
SYCL_EXTERNAL sycl::half2 sycl_half_add2(sycl::half2 a, sycl::half2 b);
SYCL_EXTERNAL sycl::half2 sycl_half_sub2(sycl::half2 a, sycl::half2 b);
SYCL_EXTERNAL sycl::half2 sycl_half_fma2(sycl::half2 a, sycl::half2 b, sycl::half2 c);



// A vector type to store Q, K, V elements.
template <typename T, int VEC_SIZE>
struct Vec {};

// A vector type to store FP32 accumulators.
template <typename T>
struct FloatVec {};

// Template vector operations.
template <typename Acc, typename A, typename B>
inline Acc mul(A a, B b);

template <typename T>
inline float sum(T v);

template <typename T>
inline float dot(T a, T b) {
  return sum(mul<T, T, T>(a, b));
}

template <typename A, typename T>
inline float dot(T a, T b) {
  return sum(mul<A, T, T>(a, b));
}

template <typename T>
inline void zero(T& dst) {
  constexpr int WORDS = (sizeof(T) / 4) == 0 ? 1 : (sizeof(T) / 4);
  union {
    T raw;
    uint32_t words[WORDS];
  } tmp;

#pragma unroll
  for (int ii = 0; ii < WORDS; ++ii) {
    tmp.words[ii] = 0u;
  }
  dst = tmp.raw;
}

