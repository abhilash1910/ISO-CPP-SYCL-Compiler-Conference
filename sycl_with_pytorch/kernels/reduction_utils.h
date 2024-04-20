// Author Abhilash Majumder (abhilash.majumder@intel.com)


#pragma once

#include <dpct/dpct.hpp>
#include <stdint.h>
#include <sycl/sycl.hpp>

template <typename T>
__inline__ T warpReduceSum(T val, const sycl::nd_item<3>& item_ct1) {
#pragma unroll
  for (int mask = 16; mask > 0; mask >>= 1)
    val += dpct::permute_sub_group_by_xor(
        item_ct1.get_sub_group(), val, mask, 32);
  return val;
}

/* Calculate the sum of all elements in a block */
template<typename T>
__inline__ T blockReduceSum(T val, const sycl::nd_item<3> &item_ct1, T *shared) {

  int lane = item_ct1.get_local_id(2) & 0x1f;
  int wid = item_ct1.get_local_id(2) >> 5;

  val = warpReduceSum<T>(val, item_ct1);

  if (lane == 0) {
    shared[wid] = val;
  }
  item_ct1.barrier();

  // Modify from blockDim.x << 5 to blockDim.x / 32. to prevent
  // blockDim.x is not divided by 32
  val = (item_ct1.get_local_id(2) < (item_ct1.get_local_range(2) / 32.f))
            ? shared[lane]
            : (T)(0.0f);
  val = warpReduceSum<T>(val, item_ct1);
  return val;
}
