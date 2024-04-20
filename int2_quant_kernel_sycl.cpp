//Author Abhilash Majumder (abhilash.majumder@intel.com)

#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>
#include<cmath>


// Size of input data
constexpr size_t N = 512;

// parameters


// Kernel to perform int2 quantization

void block_int2_quant_kernel(int* data, const sycl::nd_item<3> &item_ct1){

  const float scale =0.1f;
  const int num_bits=2;
  size_t idx = item_ct1.get_global_id(0);
  auto scaled_value = static_cast<int>(std::round(data[idx] / scale));
  // Clamp the quantized value within the range of representable integers
  data[idx] = std::max(std::min(scaled_value, (1 << (num_bits - 1)) - 1), -(1 << (num_bits - 1)));
}

 

// Kernel to perform int8 quantization

void block_int8_quant_kernel(int* data, const sycl::nd_item<3> &item_ct1){

  const int num_bits = 8;
  const float scale = 0.1f;
  size_t idx = item_ct1.get_global_id(0);
  auto scaled_value = static_cast<int>(std::round(data[idx] / scale));
  // Clamp the quantized value within the range of representable integers
  data[idx] = std::max(std::min(scaled_value, (1 << (num_bits - 1)) - 1), -(1 << (num_bits - 1)));
  
}



void call_command_queue(int *data) {
    // Initialize SYCL queue
    dpct::device_ext &dev_ct1 = dpct::get_current_device();
    sycl::queue &q = dev_ct1.in_order_queue();
    sycl::context ctx = q.get_context();
    
    // Allocate buffer for input data
    // memcpy from host to device
    int *buff_data;
    *((void **)&buff_data) = sycl::malloc_device(N, dev_ct1, ctx);
    q.memcpy((void*)(buff_data), (void*)(data), N);
    
    // Submit kernel for execution
    q.submit([&](sycl::handler& cgh) {
        
        // Execute kernel
        cgh.parallel_for( sycl::nd_range<3>(sycl::range<3>(1, 1, 128), sycl::range<3>(1, 1, 128)),
        [=](sycl::nd_item<3> item) {
            
            
            // Call the int 2 q kernel
            //block_int2_quant_kernel(buff_data, item);
            // Call the int 8 q kernel
            block_int8_quant_kernel(buff_data, item);
            
        });
    }).wait();

    // Access and use output data
    q.memcpy((void*)(data), (void *)(buff_data), N);
    std::cout<<"Result Reduction"<<std::endl;
    for (size_t i = 0; i < N ; ++i) {
        std::cout <<data[i] << std::endl;
    }
    
}
int main(){

  int data[512];
  for (int i = 0; i < 128; i++) {
    data[4 * i + 0] = i;
    data[4 * i + 1] = (i + 1 * 128);
    data[4 * i + 2] = (i + 2 * 128);
    data[4 * i + 3] = (i + 3 * 128);
  }

  call_command_queue(data);

}