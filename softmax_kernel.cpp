//Author Abhilash Majumder (abhilash.majumder@intel.com)

#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>
#include<cmath>


// Size of input data
constexpr size_t N = 512;

// Kernel to perform block reduction

void block_softmax_kernel(float* data, const sycl::nd_item<3> &item_ct1){


  size_t idx = item_ct1.get_global_id(0);
  size_t buff_size = sizeof(data[0])/sizeof(float);
  
  // Calculate max value
  float max_val = -INFINITY;
  for (size_t i = 0; i < buff_size; ++i) {
      max_val = sycl::fmax(max_val, data[i]);
  }

  // Calculate softmax
  float exp_sum = 0.0f;
  for (size_t i = 0; i < buff_size; ++i) {
      exp_sum += sycl::exp(data[i] - max_val);
  }
  data[idx] = sycl::exp(data[idx] - max_val) / exp_sum;

}


template <int GROUP_THREADS, typename InputT, int ITEMS_PER_THREAD,
          typename InputIteratorT>
void load_striped(int linear_tid, InputIteratorT block_itr,
                       InputT (&items)[ITEMS_PER_THREAD]) {
#pragma unroll
  for (int ITEM = 0; ITEM < ITEMS_PER_THREAD; ITEM++) {
    items[ITEM] = block_itr[linear_tid + ITEM * GROUP_THREADS];
  }
}

template <int GROUP_THREADS, typename T, int ITEMS_PER_THREAD,
          typename OutputIteratorT>
void store_striped(int linear_tid, OutputIteratorT block_itr,
                        T (&items)[ITEMS_PER_THREAD]) {
  OutputIteratorT thread_itr = block_itr + linear_tid;
#pragma unroll
  for (int ITEM = 0; ITEM < ITEMS_PER_THREAD; ITEM++) {
    thread_itr[(ITEM * GROUP_THREADS)] = items[ITEM];
  }
}


void call_command_queue(float *data) {
    // Initialize SYCL queue
    dpct::device_ext &dev_ct1 = dpct::get_current_device();
    sycl::queue &q = dev_ct1.in_order_queue();
    sycl::context ctx = q.get_context();
    
    // Allocate buffer for input data
    // memcpy from host to device
    //int *buff_data;
    //*((void **)&buff_data) = sycl::malloc_device(N, dev_ct1, ctx);
    //q.memcpy((void*)(buff_data), (void*)(data), N);
    // Local Accessors
    sycl::buffer<float, 1> buff_data(data, sycl::range<1>(N));
    
    // Submit kernel for execution
    q.submit([&](sycl::handler& cgh) {
        
        
        size_t temp_storage_size = 128;
        sycl::local_accessor<uint8_t, 1> tacc(sycl::range<1>(temp_storage_size), cgh);
        sycl::accessor dacc(buff_data, cgh, sycl::read_write);
        
        
        // Execute kernel
        cgh.parallel_for( sycl::nd_range<3>(sycl::range<3>(1, 1, 128), sycl::range<3>(1, 1, 128)),
        [=](sycl::nd_item<3> item) {
            
            
            float thread_data[4];
            auto *d = dacc.get_multi_ptr<sycl::access::decorated::yes>().get();
            auto *tmp = tacc.get_multi_ptr<sycl::access::decorated::yes>().get();
            //load
            load_striped<128>(item.get_local_linear_id(), d, thread_data);
            // Call the reduction kernel
            block_softmax_kernel(thread_data, item);
            //store
            store_striped<128>(item.get_local_linear_id(), d, thread_data);       

        });
    }).wait();

    // Access and use output data
    sycl::host_accessor data_accessor(buff_data, sycl::read_only);
    const float *ptr = data_accessor.get_multi_ptr<sycl::access::decorated::yes>();
    std::cout<<"Result Reduction"<<std::endl;
    for (size_t i = 0; i < N ; ++i) {
        std::cout <<ptr[i] << std::endl;
    }
    
}
int main(){

  float data[512];
  for (int i = 0; i < 128; i++) {
    data[4 * i + 0] = i*0.5f;
    data[4 * i + 1] = (i + 1 * 128)*0.5f;
    data[4 * i + 2] = (i + 2 * 128)*0.5f;
    data[4 * i + 3] = (i + 3 * 128)*0.5f;
  }

  call_command_queue(data);

}