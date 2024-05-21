#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>

using namespace sycl;
class RandomFiller {
 public:
  RandomFiller(const accessor<int> &ptr)
      : ptr_ { ptr } {
    std::random_device hwRand;
    std::uniform_int_distribution<> r { 1, 100 };
    randomNum_ = r(hwRand);
  }
  void operator()(const item<1> item) const  { ptr_[item.get_id()] = get_random(); }
  int const get_random() { return randomNum_; }

 private:
  accessor<int> ptr_;
  int randomNum_;
};

void workFunction(buffer<int, 1>& buf, queue& myQueue, const range<1> &r) {
  myQueue.submit([&](handler& cgh) {
    accessor ptr { buf, cgh };
    RandomFiller filler { ptr };

    cgh.parallel_for(r, filler);
  });
}

int main(){

int n=10;
buffer<int, 1> buf{range<1>(n)};
queue myQueue;
auto r = range<1>(n); 
  
workFunction(buf, myQueue, r);

return 0;
}