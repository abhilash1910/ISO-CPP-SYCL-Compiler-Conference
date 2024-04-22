#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>

#include <float.h>
#include <torch/extension.h>
#include <stdexcept>
#include "utils.h"

#define WARP_SIZE 32
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define DIVIDE_ROUND_UP(a, b) (((a) + (b)-1) / (b))

#define AT_DISPATCH_CASE_FLOATING_TYPES_FLOAT_ONLY(...) \
  AT_DISPATCH_CASE(at::ScalarType::Float, __VA_ARGS__)        \
  AT_DISPATCH_CASE(at::ScalarType::Half, __VA_ARGS__)



//========= helpers ================//
 
struct Float4_ {
  sycl::float2 x;
  sycl::float2 y;
};

struct Float8_ {
  sycl::float2 x;
  sycl::float2 y;
  sycl::float2 z;
  sycl::float2 w;
};

inline void from_float(float& dst, float src) {
  dst = src;
}

inline void from_float(sycl::float2 &dst, sycl::float2 src) {
  dst = src;
}

inline void from_float(sycl::float4 &dst, sycl::float4 src) {
  dst = src;
}


template <typename T>
struct Float_Trait {
  using Type = T;
};

template <>
struct Float_Trait<c10::Half> {
  using Type = uint16_t;
};

template <>
struct Float_Trait<c10::BFloat16> {
  using Type = sycl::ext::oneapi::bfloat16;
};


template <>
struct FloatVec<sycl::half> {
  using Type = float;
};
template <>
struct FloatVec<sycl::half2> {
  using Type = sycl::float2;
};

template <>
struct FloatVec<sycl::half4> {
  using Type = Float4_;
};
template <>
struct FloatVec<sycl::half8> {
  using Type = Float8_;
};





// Q*K^T operation.
template <int THREAD_GROUP_SIZE, typename Vec, int N>
inline float qk_dot_(
    const Vec* q,
    const Vec* k,
    const sycl::nd_item<3>& item_ct1) {
  using A_vec = typename FloatVec<Vec>::Type;
  // Compute the parallel products for Q*K^T (treat vector lanes separately).
  A_vec qk_vec = mul<A_vec, Vec, Vec>(q[0], k[0]);
#pragma unroll
  for (int ii = 1; ii < N; ++ii) {
    qk_vec = sycl::fma(q[ii], k[ii], qk_vec);
  }

  // Finalize the reduction across lanes.
  float qk = sum(qk_vec);
#pragma unroll
  for (int mask = THREAD_GROUP_SIZE / 2; mask >= 1; mask /= 2) {
    
    qk += dpct::permute_sub_group_by_xor(
        item_ct1.get_sub_group(), qk, mask);
  }
  return qk;
}

template <typename T, int THREAD_GROUP_SIZE>
struct Qk_dot {
  template <typename Vec, int N>
  static inline float dot(
      const Vec* q,
      const Vec* k,
      const sycl::nd_item<3>& item_ct1) {
    return qk_dot_<THREAD_GROUP_SIZE, Vec, N>(q, k, item_ct1);
  }
};

template <int NUM_WARPS>
inline float block_sum(
    float* red_smem,
    float sum,
    const sycl::nd_item<3>& item_ct1) {
  // Decompose the thread index into warp / lane.
  int warp = item_ct1.get_local_id(2) / WARP_SIZE;
  int lane = item_ct1.get_local_id(2) % WARP_SIZE;

  // Compute the sum per warp.
#pragma unroll
  for (int mask = WARP_SIZE / 2; mask >= 1; mask /= 2) {
    
    /*
    DPCT1096:42: The right-most dimension of the work-group used in the SYCL
    kernel that calls this function may be less than "32". The function
    "dpct::permute_sub_group_by_xor" may return an unexpected result on the CPU
    device. Modify the size of the work-group to ensure that the value of the
    right-most dimension is a multiple of "32".
    */
    sum += dpct::permute_sub_group_by_xor(
        item_ct1.get_sub_group(), sum, mask);
  }

  // Warp leaders store the data to shared memory.
  if (lane == 0) {
    red_smem[warp] = sum;
  }

  // Make sure the data is in shared memory.
  
  item_ct1.barrier(sycl::access::fence_space::local_space);

  // The warps compute the final sums.
  if (lane < NUM_WARPS) {
    sum = red_smem[lane];
  }

  // Parallel reduction inside the warp.
#pragma unroll
  for (int mask = NUM_WARPS / 2; mask >= 1; mask /= 2) {
    
    
    sum += dpct::permute_sub_group_by_xor(
        item_ct1.get_sub_group(), sum, mask);
  }

  // Broadcast to other threads.
  
  
  return dpct::select_from_sub_group(
        item_ct1.get_sub_group(), sum, 0);
}

template <
    typename scalar_t,
    typename Q_Vec_t,
    int HEAD_SIZE,
    int BLOCK_SIZE,
    int NUM_THREADS,
    int VEC_SIZE,
    int PARTITION_SIZE = 0> // Zero means no partitioning.
void attention_kernel(
    float* __restrict__ exp_sums, // [num_seqs, num_heads, max_num_partitions]
    float* __restrict__ max_logits, // [num_seqs, num_heads, max_num_partitions]
    scalar_t* __restrict__ out, // [num_seqs, num_heads, max_num_partitions,
                                // head_size]
    const scalar_t* __restrict__ q, // [num_seqs, num_heads, head_size]
    const scalar_t* __restrict__ k_cache, // [num_blocks, num_kv_heads,
                                          // head_size/x, block_size, x]
    const scalar_t* __restrict__ v_cache, // [num_blocks, num_kv_heads,
                                          // head_size, block_size]
    const int num_kv_heads, // [num_heads]
    const float scale,
    const int* __restrict__ block_tables, // [num_seqs, max_num_blocks_per_seq]
    const int* __restrict__ context_lens, // [num_seqs]
    const int max_num_blocks_per_seq,
    const float* __restrict__ alibi_slopes, // [num_heads]
    const int q_stride,
    const int kv_block_stride,
    const int kv_head_stride,
    const sycl::nd_item<3>& item_ct1,
    uint8_t* dpct_local,
    Q_Vec_t* q_vecs,
    float* red_smem) {
  const int seq_idx = item_ct1.get_group(1);
  const int partition_idx = item_ct1.get_group(0);
  const int max_num_partitions = item_ct1.get_group_range(0);
  constexpr bool USE_PARTITIONING = PARTITION_SIZE > 0;
  const int context_len = context_lens[seq_idx];
  if (USE_PARTITIONING && partition_idx * PARTITION_SIZE >= context_len) {
    // No work to do. Terminate the thread block.
    return;
  }

  const int num_context_blocks = DIVIDE_ROUND_UP(context_len, BLOCK_SIZE);
  const int num_blocks_per_partition =
      USE_PARTITIONING ? PARTITION_SIZE / BLOCK_SIZE : num_context_blocks;

  // [start_block_idx, end_block_idx) is the range of blocks to process.
  const int start_block_idx =
      USE_PARTITIONING ? partition_idx * num_blocks_per_partition : 0;
  const int end_block_idx =
      MIN(start_block_idx + num_blocks_per_partition, num_context_blocks);
  const int num_blocks = end_block_idx - start_block_idx;

  // [start_token_idx, end_token_idx) is the range of tokens to process.
  const int start_token_idx = start_block_idx * BLOCK_SIZE;
  const int end_token_idx =
      MIN(start_token_idx + num_blocks * BLOCK_SIZE, context_len);
  const int num_tokens = end_token_idx - start_token_idx;

  constexpr int THREAD_GROUP_SIZE = MAX(WARP_SIZE / BLOCK_SIZE, 1);
  constexpr int NUM_THREAD_GROUPS =
      NUM_THREADS / THREAD_GROUP_SIZE; // Note: This assumes THREAD_GROUP_SIZE
                                       // divides NUM_THREADS
  assert(NUM_THREADS % THREAD_GROUP_SIZE == 0);
  constexpr int NUM_TOKENS_PER_THREAD_GROUP =
      DIVIDE_ROUND_UP(BLOCK_SIZE, WARP_SIZE);
  constexpr int NUM_WARPS = NUM_THREADS / WARP_SIZE;
  const int thread_idx = item_ct1.get_local_id(2);
  const int warp_idx = thread_idx / WARP_SIZE;
  const int lane = thread_idx % WARP_SIZE;

  const int head_idx = item_ct1.get_group(2);
  const int num_heads = item_ct1.get_group_range(2);
  const int num_queries_per_kv = num_heads / num_kv_heads;

  const int kv_head_idx = head_idx / num_queries_per_kv;
  ;
  const float alibi_slope =
      alibi_slopes == nullptr ? 0.f : alibi_slopes[head_idx];

  // A vector type to store a part of a key or a query.
  // The vector size is configured in such a way that the threads in a thread
  // group fetch or compute 16 bytes at a time. For example, if the size of a
  // thread group is 4 and the data type is half, then the vector size is 16 /
  // (4 * sizeof(half)) == 2.

  // constexpr int VEC_SIZE = MAX(16 / (THREAD_GROUP_SIZE * sizeof(scalar_t)),
  // 1);

  constexpr int NUM_ELEMS_PER_THREAD = HEAD_SIZE / THREAD_GROUP_SIZE;
  constexpr int NUM_VECS_PER_THREAD = NUM_ELEMS_PER_THREAD / VEC_SIZE;

  const int thread_group_idx = thread_idx / THREAD_GROUP_SIZE;
  const int thread_group_offset = thread_idx % THREAD_GROUP_SIZE;

  // Load the query to registers.
  // Each thread in a thread group has a different part of the query.
  // For example, if the the thread group size is 4, then the first thread in
  // the group has 0, 4, 8, ... th vectors of the query, and the second thread
  // has 1, 5, 9, ... th vectors of the query, and so on. 
  const scalar_t* q_ptr = q + seq_idx * q_stride + head_idx * HEAD_SIZE;

#pragma unroll
  for (int i = thread_group_idx; i < NUM_VECS_PER_THREAD;
       i += NUM_THREAD_GROUPS) {
    const int vec_idx = thread_group_offset + i * THREAD_GROUP_SIZE;
    q_vecs[thread_group_offset * NUM_VECS_PER_THREAD + i] =
        *reinterpret_cast<const Q_Vec_t*>(q_ptr + vec_idx * VEC_SIZE);
  }
  
  item_ct1.barrier(sycl::access::fence_space::local_space); // TODO(naed90): possible speedup if this is replaced with
                      // a memory wall right before we use q_vecs

  // Memory planning.
  auto shared_mem = (char*)dpct_local;
  
  float* logits = reinterpret_cast<float*>(shared_mem);
  // Workspace for reduction.

  // x == THREAD_GROUP_SIZE * VEC_SIZE
  // Each thread group fetches x elements from the key at a time.
  constexpr int x = 16 / sizeof(scalar_t);
  float qk_max = -FLT_MAX;

  // Iterate over the key blocks.
  // Each warp fetches a block of keys for each iteration.
  // Each thread group in a warp fetches a key from the block, and computes
  // dot product with the query.
  const int* block_table = block_tables + seq_idx * max_num_blocks_per_seq;

  for (int block_idx = start_block_idx + warp_idx; block_idx < end_block_idx;
       block_idx += NUM_WARPS) {
    
    const int64_t physical_block_number =
        static_cast<int64_t>(block_table[block_idx]);

    // Load a key to registers.
    // Each thread in a thread group has a different part of the key.
    // For example, if the the thread group size is 4, then the first thread in
    // the group has 0, 4, 8, ... th vectors of the key, and the second thread
    // has 1, 5, 9, ... th vectors of the key, and so on.

    for (int i = 0; i < NUM_TOKENS_PER_THREAD_GROUP; i++) {
      const int physical_block_offset =
          (thread_group_idx + i * WARP_SIZE) % BLOCK_SIZE;
      const int token_idx = block_idx * BLOCK_SIZE + physical_block_offset;

      Q_Vec_t k_vecs[NUM_VECS_PER_THREAD];

#pragma unroll
      for (int j = 0; j < NUM_VECS_PER_THREAD; j++) {
        const scalar_t* k_ptr = k_cache +
            physical_block_number * kv_block_stride +
            kv_head_idx * kv_head_stride + physical_block_offset * x;

        const int vec_idx = thread_group_offset + j * THREAD_GROUP_SIZE;
        const int offset1 = (vec_idx * VEC_SIZE) / x;
        const int offset2 = (vec_idx * VEC_SIZE) % x;
        k_vecs[j] = *reinterpret_cast<const Q_Vec_t*>(
            k_ptr + offset1 * BLOCK_SIZE * x + offset2);
      }
      
  //==============================QK================================//

      // Compute dot product.
      // This includes a reduction across the threads in the same thread group.
      // Q_Vec_t q_vec_[NUM_VECS_PER_THREAD] = q_vecs + thread_group_offset *
      // THREAD_GROUP_SIZE;
      float qk = scale *
          Qk_dot<scalar_t, THREAD_GROUP_SIZE>::
              template dot<Q_Vec_t, NUM_VECS_PER_THREAD>(
                     q_vecs + thread_group_offset * NUM_VECS_PER_THREAD,
                     k_vecs,
                     item_ct1);
      // Add the ALiBi bias if slopes are given.
      qk +=
          (alibi_slope != 0) ? alibi_slope * (token_idx - context_len + 1) : 0;

      if (thread_group_offset == 0) {
        // Store the partial reductions to shared memory.
        
        const bool mask = token_idx >= context_len;
        logits[token_idx - start_token_idx] = mask ? 0.f : qk;
        // Update the max value.
        qk_max = mask ? qk_max : sycl::fmax(qk_max, qk);
      }
    }
  }

  // Perform reduction across the threads in the same warp to get the
  // max qk value for each "warp" (not across the thread block yet).
  // The 0-th thread of each thread group already has its max qk value.
#pragma unroll
  for (int mask = WARP_SIZE / 2; mask >= THREAD_GROUP_SIZE; mask /= 2) {
  
    
    qk_max = sycl::fmax(
        qk_max,
        dpct::permute_sub_group_by_xor(
            item_ct1.get_sub_group(), qk_max, mask));
  }
  if (lane == 0) {
    red_smem[warp_idx] = qk_max;
  }
  
  item_ct1.barrier(sycl::access::fence_space::local_space);

  
  // Get the max qk value for the sequence.
  qk_max = lane < NUM_WARPS ? red_smem[lane] : -FLT_MAX;
#pragma unroll
  for (int mask = NUM_WARPS / 2; mask >= 1; mask /= 2) {
    
   
    qk_max = sycl::fmax(
        qk_max,
        dpct::permute_sub_group_by_xor(
            item_ct1.get_sub_group(), qk_max, mask));
  }
  // Broadcast the max qk value to all threads.
  
  
  qk_max = dpct::select_from_sub_group(
          item_ct1.get_sub_group(), qk_max, 0);

  // Get the sum of the exp values.
  float exp_sum = 0.f;
  for (int i = thread_idx; i < num_tokens; i += NUM_THREADS) {
    float val = sycl::exp(logits[i] - qk_max);
    logits[i] = val;
    exp_sum += val;
  }
  exp_sum = block_sum<NUM_WARPS>(&red_smem[NUM_WARPS], exp_sum, item_ct1);

  
  //==============================Softmax================================//
  
  
  // Compute softmax.
  const float inv_sum = 1.f / (exp_sum + 1e-6f);
  for (int i = thread_idx; i < num_tokens; i += NUM_THREADS) {
    logits[i] *= inv_sum;
  }
  
  item_ct1.barrier(sycl::access::fence_space::local_space);

  

  // Each thread will fetch 16 bytes from the value cache at a time.
  constexpr int V_VEC_SIZE = MIN(16 / sizeof(scalar_t), BLOCK_SIZE);
  using V_vec = typename Vec<scalar_t, V_VEC_SIZE>::Type;
  using L_vec = typename Vec<scalar_t, V_VEC_SIZE>::Type;
  using Float_L_vec = typename FloatVec<L_vec>::Type;

  constexpr int NUM_V_VECS_PER_ROW = BLOCK_SIZE / V_VEC_SIZE;
  constexpr int NUM_ROWS_PER_ITER = WARP_SIZE / NUM_V_VECS_PER_ROW;
  constexpr int NUM_ROWS_PER_THREAD =
      DIVIDE_ROUND_UP(HEAD_SIZE, NUM_ROWS_PER_ITER);

  
  //==============================Softmax * V================================//
  float accs[NUM_ROWS_PER_THREAD];
#pragma unroll
  for (int i = 0; i < NUM_ROWS_PER_THREAD; i++) {
    accs[i] = 0.f;
  }

  scalar_t zero_value;
  zero(zero_value);
  for (int block_idx = start_block_idx + warp_idx; block_idx < end_block_idx;
       block_idx += NUM_WARPS) {
 
    const int64_t physical_block_number =
        static_cast<int64_t>(block_table[block_idx]);
    const int physical_block_offset = (lane % NUM_V_VECS_PER_ROW) * V_VEC_SIZE;
    const int token_idx = block_idx * BLOCK_SIZE + physical_block_offset;
    L_vec logits_vec;
    from_float(
        logits_vec,
        *reinterpret_cast<Float_L_vec*>(logits + token_idx - start_token_idx));

    const scalar_t* v_ptr = v_cache + physical_block_number * kv_block_stride +
        kv_head_idx * kv_head_stride;
#pragma unroll
    for (int i = 0; i < NUM_ROWS_PER_THREAD; i++) {
      const int row_idx = lane / NUM_V_VECS_PER_ROW + i * NUM_ROWS_PER_ITER;
      if (row_idx < HEAD_SIZE) {
        const int offset = row_idx * BLOCK_SIZE + physical_block_offset;
        V_vec v_vec = *reinterpret_cast<const V_vec*>(v_ptr + offset);
        if (block_idx == num_context_blocks - 1) {
          
          scalar_t* v_vec_ptr = reinterpret_cast<scalar_t*>(&v_vec);
#pragma unroll
          for (int j = 0; j < V_VEC_SIZE; j++) {
            v_vec_ptr[j] =
                token_idx + j < context_len ? v_vec_ptr[j] : zero_value;
          }
        }
        accs[i] += dot(logits_vec, v_vec);
      }
    }
  }

  // Perform reduction within each warp.
#pragma unroll
  for (int i = 0; i < NUM_ROWS_PER_THREAD; i++) {
    float acc = accs[i];
#pragma unroll
    for (int mask = NUM_V_VECS_PER_ROW / 2; mask >= 1; mask /= 2) {
     
     
      acc += dpct::permute_sub_group_by_xor(
          item_ct1.get_sub_group(), acc, mask);
    }
    accs[i] = acc;
  }

  
  item_ct1.barrier(sycl::access::fence_space::local_space);

  // Perform reduction across warps.
  float* out_smem = reinterpret_cast<float*>(shared_mem);
#pragma unroll
  for (int i = NUM_WARPS; i > 1; i /= 2) {
    int mid = i / 2;
    // Upper warps write to shared memory.
    if (warp_idx >= mid && warp_idx < i) {
      float* dst = &out_smem[(warp_idx - mid) * HEAD_SIZE];
#pragma unroll
      for (int i = 0; i < NUM_ROWS_PER_THREAD; i++) {
        const int row_idx = lane / NUM_V_VECS_PER_ROW + i * NUM_ROWS_PER_ITER;
        if (row_idx < HEAD_SIZE && lane % NUM_V_VECS_PER_ROW == 0) {
          dst[row_idx] = accs[i];
        }
      }
    }
    
    item_ct1.barrier(sycl::access::fence_space::local_space);

    // Lower warps update the output.
    if (warp_idx < mid) {
      const float* src = &out_smem[warp_idx * HEAD_SIZE];
#pragma unroll
      for (int i = 0; i < NUM_ROWS_PER_THREAD; i++) {
        const int row_idx = lane / NUM_V_VECS_PER_ROW + i * NUM_ROWS_PER_ITER;
        if (row_idx < HEAD_SIZE && lane % NUM_V_VECS_PER_ROW == 0) {
          accs[i] += src[row_idx];
        }
      }
    }
    
    item_ct1.barrier(sycl::access::fence_space::local_space);
  }

  // Write the final output.
  if (warp_idx == 0) {
    scalar_t* out_ptr = out +
        seq_idx * num_heads * max_num_partitions * HEAD_SIZE +
        head_idx * max_num_partitions * HEAD_SIZE + partition_idx * HEAD_SIZE;
#pragma unroll
    for (int i = 0; i < NUM_ROWS_PER_THREAD; i++) {
      const int row_idx = lane / NUM_V_VECS_PER_ROW + i * NUM_ROWS_PER_ITER;
      if (row_idx < HEAD_SIZE && lane % NUM_V_VECS_PER_ROW == 0) {
        from_float(*(out_ptr + row_idx), accs[i]);
      }
    }
  }
}



// Grid: (num_heads, num_seqs, 1).
template <
    typename scalar_t,
    typename Q_Vec_t,
    int HEAD_SIZE,
    int BLOCK_SIZE,
    int NUM_THREADS,
    int VEC_SIZE>
void call_attention_kernel(
    scalar_t* __restrict__ out, // [num_seqs, num_heads, head_size]
    const scalar_t* __restrict__ q, // [num_seqs, num_heads, head_size]
    const scalar_t* __restrict__ k_cache, // [num_blocks, num_kv_heads,
                                          // head_size/x, block_size, x]
    const scalar_t* __restrict__ v_cache, // [num_blocks, num_kv_heads,
                                          // head_size, block_size]
    const int num_kv_heads, // [num_heads]
    const float scale,
    const int* __restrict__ block_tables, // [num_seqs, max_num_blocks_per_seq]
    const int* __restrict__ context_lens, // [num_seqs]
    const int max_num_blocks_per_seq,
    const float* __restrict__ alibi_slopes, // [num_heads]
    const int q_stride,
    const int kv_block_stride,
    const int kv_head_stride,
    const sycl::nd_item<3>& item_ct1,
    uint8_t* dpct_local,
    Q_Vec_t* q_vecs,
    float* red_smem) {
  attention_kernel<
      scalar_t,
      Q_Vec_t,
      HEAD_SIZE,
      BLOCK_SIZE,
      NUM_THREADS,
      VEC_SIZE>(
      /* exp_sums */ nullptr,
      /* max_logits */ nullptr,
      out,
      q,
      k_cache,
      v_cache,
      num_kv_heads,
      scale,
      block_tables,
      context_lens,
      max_num_blocks_per_seq,
      alibi_slopes,
      q_stride,
      kv_block_stride,
      kv_head_stride,
      item_ct1,
      dpct_local,
      q_vecs,
      red_smem);
}


  

template <typename scalar_t, int BLOCK_SIZE, int NUM_THREADS = 128>
void attention_sycl(
    torch::Tensor& out,
    torch::Tensor& query,
    torch::Tensor& key_cache,
    torch::Tensor& value_cache,
    int num_kv_heads,
    float scale,
    torch::Tensor& block_tables,
    torch::Tensor& context_lens,
    int max_context_len,
    const c10::optional<torch::Tensor>& alibi_slopes) {
  int num_seqs = query.size(0);
  int num_heads = query.size(1);
  int head_size = query.size(2);
  int max_num_blocks_per_seq = block_tables.size(1);
  int q_stride = query.stride(0);
  int kv_block_stride = key_cache.stride(0);
  int kv_head_stride = key_cache.stride(1);

  constexpr int THREAD_GROUP_SIZE = MAX(WARP_SIZE / BLOCK_SIZE, 1);
  constexpr int VEC_SIZE = MAX(16 / (THREAD_GROUP_SIZE * sizeof(scalar_t)), 1);
  constexpr int HEAD_SIZE = 64;
  using sycl_t = torch_sycl::sycl_::SyclTypeTrait<scalar_t>::Type;
  using Q_Vec = typename Vec<sycl_t, VEC_SIZE>::Type;

  int num_vecs_per_thread = head_size / THREAD_GROUP_SIZE / VEC_SIZE;
  assert(head_size % THREAD_GROUP_SIZE == 0);

  // NOTE: alibi_slopes is optional.
  const float* alibi_slopes_ptr = alibi_slopes
      ? reinterpret_cast<const float*>(alibi_slopes.value().data_ptr())
      : nullptr;

  sycl_t* out_ptr = reinterpret_cast<sycl_t*>(out.data_ptr());
  sycl_t* query_ptr = reinterpret_cast<sycl_t*>(query.data_ptr());
  sycl_t* key_cache_ptr = reinterpret_cast<sycl_t*>(key_cache.data_ptr());
  sycl_t* value_cache_ptr = reinterpret_cast<sycl_t*>(value_cache.data_ptr());
  int* block_tables_ptr = block_tables.data_ptr<int>();
  int* context_lens_ptr = context_lens.data_ptr<int>();

  constexpr int NUM_WARPS = NUM_THREADS / WARP_SIZE;
  int padded_max_context_len =
      DIVIDE_ROUND_UP(max_context_len, BLOCK_SIZE) * BLOCK_SIZE;
  
  int logits_size = padded_max_context_len * sizeof(float);
  int outputs_size = (NUM_WARPS / 2) * head_size * sizeof(float);
  // Python-side check in vllm.worker.worker._check_if_can_support_max_seq_len
  // Keep that in sync with the logic here!
  int shared_mem_size = std::max(logits_size, outputs_size);

  sycl::range<3> grid(1, num_seqs, num_heads);
  sycl::range<3> block(1, 1, NUM_THREADS);
  sycl::queue& queue = torch_sycl::sycl_::sycltorchGetQueue();
  
  queue.submit([&](sycl::handler& cgh) {                                    
    sycl::local_accessor<uint8_t, 1> dpct_local_acc_ct1(                    
        sycl::range<1>(shared_mem_size), cgh);                              
    sycl::local_accessor<Q_Vec, 1> q_vecs_acc_ct1(                          
        sycl::range<1>(THREAD_GROUP_SIZE * num_vecs_per_thread), cgh);      
    sycl::local_accessor<float, 1> red_smem_acc_ct1(                        
        sycl::range<1>(2 * NUM_WARPS), cgh);                                                          
                                                                            
    cgh.parallel_for(                                                       
        sycl::nd_range<3>(grid * block, block),                             
        [=](sycl::nd_item<3> item_ct1) [[intel::reqd_sub_group_size(32)]] { 
          call_attention_kernel<                                        
              sycl_t,                                                       
              Q_Vec,                                                        
              HEAD_SIZE,                                                    
              BLOCK_SIZE,                                                   
              NUM_THREADS,                                                  
              VEC_SIZE>(                                                    
              out_ptr,                                                  
              query_ptr,                                                
              key_cache_ptr,                                            
              value_cache_ptr,                                          
              num_kv_heads,                                                 
              scale,                                                    
              block_tables_ptr,                                         
              context_lens_ptr,                                         
              max_num_blocks_per_seq,                                   
              alibi_slopes_ptr,                                         
              q_stride,                                                
              kv_block_stride,                                         
              kv_head_stride,                                          
              item_ct1,                                                     
              dpct_local_acc_ct1.get_pointer(),                             
              q_vecs_acc_ct1.get_pointer(),                                 
              red_smem_acc_ct1.get_pointer());                              
        });                                                                 
  });  
  
}

template <typename scalar_t>
void attention(
    torch::Tensor& out,
    torch::Tensor& query,
    torch::Tensor& key_cache,
    torch::Tensor& value_cache,
    int num_kv_heads,
    float scale,
    torch::Tensor& block_tables,
    torch::Tensor& context_lens,
    int block_size,
    int max_context_len,
    const c10::optional<torch::Tensor>& alibi_slopes,
    const std::string& kv_cache_dtype) {
  
     attention_sycl<scalar_t, 32>( 
                          out,                                                   
                          query,                                                 
                          key_cache,                                             
                          value_cache,                                           
                          num_kv_heads,                                          
                          scale,                                                 
                          block_tables,                                          
                          context_lens,                                          
                          max_context_len,                                       
                          alibi_slopes);
      
}

