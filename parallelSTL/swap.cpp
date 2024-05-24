#include <oneapi/dpl/utility>
#include <sycl/sycl.hpp>
#include <iostream>
constexpr sycl::access::mode sycl_read_write = sycl::access::mode::read_write;
class KernelSwap;
void kernel_test() {
  sycl::queue deviceQueue;
  sycl::range<1> numOfItems{2};
  sycl::cl_int swap_num[2] = {4, 5};
  std::cout << swap_num[0] << ", " << swap_num[1] << std::endl;
  {
  sycl::buffer<sycl::cl_int, 1> swap_buffer
  (swap_num, numOfItems);
  deviceQueue.submit([&](sycl::handler &cgh) {
  auto swap_accessor = swap_buffer.get_access<sycl_read_write>(cgh);
  cgh.single_task<class KernelSwap>([=]() {
      int & num1 = swap_accessor[0];
      int & num2 = swap_accessor[1];
      oneapi::dpl::swap(num1, num2);
      });
  });
  }
  std::cout << swap_num[0] << ", " << swap_num[1] << std::endl;
}
int main() {
    kernel_test();
    return 0;
}