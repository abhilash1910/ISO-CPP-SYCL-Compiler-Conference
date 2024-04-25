//Author Abhilash Majumder (abhilash.majumder@intel.com)

#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>



// Kernel to perform SIMD device data sharing


void call_simd_command_queue() {
    // Initialize SYCL queue
    dpct::device_ext &dev_ct1 = dpct::get_current_device();
    sycl::queue &q = dev_ct1.in_order_queue();
    sycl::context ctx = q.get_context();
  
    constexpr int N = 1024 * 1024;
    int *data = sycl::malloc_shared<int>(N, q);
    int *data2 = sycl::malloc_shared<int>(N, q);
    memset(data2, 0xFF, sizeof(int) * N);
  
    auto e = q.submit([&](sycl::handler &cgh) {
      cgh.parallel_for(sycl::nd_range(sycl::range{N / 16}, sycl::range{32}),
                     [=](sycl::nd_item<1> it) {
                       int i = it.get_global_linear_id();
                       i = i * 16;
                       for (int j = i; j < (i + 16); j++) {
                         data[j] = data2[j];
                       }
                     });
    });
    
  q.wait();
  
  /* Prints are heavy
  // Print data1
  std::cout << "Data 1:" << std::endl;
  for (int i = 0; i < N; ++i) {
      std::cout << data[i] << " ";
      if ((i + 1) % 16 == 0) {
          std::cout << std::endl;
      }
  }
  std::cout << std::endl;

  // Print data2
  std::cout << "Data 2:" << std::endl;
  for (int i = 0; i < N; ++i) {
      std::cout << data2[i] << " ";
      if ((i + 1) % 16 == 0) {
          std::cout << std::endl;
      }
  }
  std::cout << std::endl;
  */
  
  }
  
int main(){
  call_simd_command_queue();
  return 0;
  
}