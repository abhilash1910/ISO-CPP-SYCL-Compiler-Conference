//Author Abhilash Majumder (abhilash.majumder@intel.com)

#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>


// Size of input data
constexpr size_t N = 512;

// Block size for reduction
constexpr size_t BlockSize = 128;

// Kernel to perform block reduction

void block_reduce_kernel(int* data, const sycl::nd_item<3> &item_ct1){


  int threadid = item_ct1.get_local_id(2);
  int input_data = data[threadid];
  int output = 0;
  //Sum reduce kernel
  output = sycl::reduce_over_group(item_ct1.get_group(), input_data , sycl::plus<>());
  data[threadid] = output;

}
void call_command_queue(int *data) {
    // Initialize SYCL queue
    dpct::device_ext &dev_ct1 = dpct::get_current_device();
    sycl::queue &q = dev_ct1.in_order_queue();
    sycl::context ctx = q.get_context();
    
    // Allocate buffer for input data
    // memcpy from host to device
    // USM
    int *buff_data;
    *((void **)&buff_data) = sycl::malloc_device(N, dev_ct1, ctx);
    q.memcpy((void*)(buff_data), (void*)(data), N);
    
    
    // Submit kernel for execution
    q.submit([&](sycl::handler& cgh) {
        
        // Execute kernel
        cgh.parallel_for( sycl::nd_range<3>(sycl::range<3>(1, 1, 128), sycl::range<3>(1, 1, 128)),
        [=](sycl::nd_item<3> item) {
            
            // Call the reduction kernel
            block_reduce_kernel(buff_data, item);

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
    data[4 * i + 1] = i + 1 * 128;
    data[4 * i + 2] = i + 2 * 128;
    data[4 * i + 3] = i + 3 * 128;
  }

  call_command_queue(data);
  return 0;
}