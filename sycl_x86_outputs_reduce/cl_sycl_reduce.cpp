//Author Abhilash Majumder (abhilash.majumder@intel.com)
//Code hosted at GodBolt Compiler Explorer: https://godbolt.org/z/nPfrGGvd4

#include <iostream>
#include <CL/sycl.hpp>


// Size of input data
constexpr size_t N = 512;

// Block size for reduction
constexpr size_t BlockSize = 128;

// Kernel to perform block reduction

void block_reduce_kernel(cl::sycl::accessor<int, 1> data, const sycl::nd_item<3> &item_ct1){


  int threadid = item_ct1.get_local_id(2);
  int input_data = data[threadid];
  int output = 0;
  //Sum reduce kernel
  output = cl::sycl::reduce_over_group(item_ct1.get_group(), input_data , cl::sycl::plus<>());
  data[threadid] = output;

}
void call_command_queue(int *data) {
    // Initialize SYCL queue
    cl::sycl::default_selector device_selector;

    cl::sycl::queue q(device_selector);
    std::cout << "Running on "
             << q.get_device().get_info<cl::sycl::info::device::name>()
             << "\n";
    cl::sycl::context ctx = q.get_context();
    
    // Allocate buffer for input data
    // memcpy from host to device
    // USM
    cl::sycl::buffer<int, 1> a_sycl(data, cl::sycl::range<1>(N));
    
    // Submit kernel for execution
    q.submit([&](sycl::handler& cgh) {
        auto a_acc = a_sycl.get_access<cl::sycl::access::mode::read_write>(cgh);
        // Execute kernel
        cgh.parallel_for( cl::sycl::nd_range<3>(cl::sycl::range<3>(1, 1, 128), cl::sycl::range<3>(1, 1, 128)),
        [=](cl::sycl::nd_item<3> item) {
            
            // Call the reduction kernel
            block_reduce_kernel(a_acc, item);

        });
    }).wait();

    // Access and use output data
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

}
