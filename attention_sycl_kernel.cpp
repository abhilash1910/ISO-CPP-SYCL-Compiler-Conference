//Author Abhilash Majumder (abhilash.majumder@intel.com)

#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>
#include<cmath>


// Size of input data
constexpr size_t N = 512;

// parameters


// Kernel to perform attention mechanism

void attention_kernel(float* Q, float* K, float* V, float* output, int seq_length, int head_count, int dim_per_head, const sycl::nd_item<3> &item_ct1){

  size_t batch_index = item_ct1.get_global_id(0);
  int i,j,head,k;
  // Loop through each head
  for ( head = 0; head < head_count; ++head) {
      // Calculate attention score
      for ( i = 0; i < seq_length; ++i) {
          float sum = 0.0f;
          for ( j = 0; j < dim_per_head; ++j) {
              sum += Q[batch_index * head_count * seq_length * dim_per_head + head * seq_length * dim_per_head + i * dim_per_head + j] *
                     K[batch_index * head_count * seq_length * dim_per_head + head * seq_length * dim_per_head + i * dim_per_head + j];
          }
          
          // Apply softmax
          float max_val = -INFINITY;
          for ( k = 0; k < seq_length; ++k) {
              max_val = sycl::fmax(max_val, sum);
          }
  
          float exp_sum = 0.0f;
          for ( k = 0; k < seq_length; ++k) {
              exp_sum += sycl::exp(sum - max_val);
          }
  
          output[batch_index * head_count * seq_length * dim_per_head + head * seq_length * dim_per_head + i * dim_per_head + j] = sycl::exp(sum - max_val) / exp_sum;
      }
        }

}



void call_command_queue(float* Q, float* K, float* V, float* output, int batch_size, int seq_length, int head_count, int dim_per_head) {
    // Initialize SYCL queue
    dpct::device_ext &dev_ct1 = dpct::get_current_device();
    sycl::queue &q = dev_ct1.in_order_queue();
    sycl::context ctx = q.get_context();
    
    int si=batch_size * head_count * seq_length * dim_per_head;
    // Allocate buffer for input data
    float *buff_Q,*buff_K,*buff_V,*buff_output;
    *((void **)&buff_Q) = sycl::malloc_device(si, dev_ct1, ctx);
    q.memcpy((void*)(buff_Q), (void*)(Q), si);
    *((void **)&buff_K) = sycl::malloc_device(si, dev_ct1, ctx);
    q.memcpy((void*)(buff_K), (void*)(K), si);
    *((void **)&buff_V) = sycl::malloc_device(si, dev_ct1, ctx);
    q.memcpy((void*)(buff_V), (void*)(V), si);
    *((void **)&buff_output) = sycl::malloc_device(si, dev_ct1, ctx);
    q.memcpy((void*)(buff_output), (void*)(output), si);
    
    /*
    sycl::buffer<float, 1> buff_Q(Q, sycl::range<1>(batch_size * head_count * seq_length * dim_per_head));
    sycl::buffer<float, 1> buff_K(K, sycl::range<1>(batch_size * head_count * seq_length * dim_per_head));
    sycl::buffer<float, 1> buff_V(V, sycl::range<1>(batch_size * head_count * seq_length * dim_per_head));
    sycl::buffer<float, 1> buff_output(output, sycl::range<1>(batch_size * head_count * seq_length * dim_per_head));
    */
    // Submit kernel for execution
    q.submit([&](sycl::handler& cgh) {
        
        // Execute kernel
        cgh.parallel_for( sycl::nd_range<3>(sycl::range<3>(1, 1, 128), sycl::range<3>(1, 1, 128)),
        [=](sycl::nd_item<3> item) {
            
            attention_kernel(buff_Q, buff_K, buff_V, buff_output, seq_length, head_count, dim_per_head, item);
            
        });
    }).wait();

    // Access and use output data
    //const float *output_ptr = buff_output.get_access<sycl::access::mode::read>();
    q.memcpy((void*)(output), (void *)(buff_output), si);
    
    std::cout<<"Result Attention"<<std::endl;
    for (int batch = 0; batch < batch_size; ++batch) {
    for (int head = 0; head < head_count; ++head) {
        for (int i = 0; i < seq_length; ++i) {
            for (int j = 0; j < dim_per_head; ++j) {
                std::cout << "Output[" << batch << "][" << head << "][" << i << "][" << j << "] = " << output[batch * head_count * seq_length * dim_per_head + head * seq_length * dim_per_head + i * dim_per_head + j] << std::endl;
            }
        }
    }}
}
int main(){

  const int batch_size = 1;
  const int seq_length = 10;
  const int head_count = 4;
  const int dim_per_head = 8;
  float Q[batch_size * head_count * seq_length * dim_per_head];
  float K[batch_size * head_count * seq_length * dim_per_head];
  float V[batch_size * head_count * seq_length * dim_per_head];
  float output[batch_size * head_count * seq_length * dim_per_head];
  
  call_command_queue(Q, K, V, output, batch_size, seq_length, head_count, dim_per_head);

}