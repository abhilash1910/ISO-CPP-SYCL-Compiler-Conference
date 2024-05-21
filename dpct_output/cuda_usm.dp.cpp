// RUN: dpct --format-range=none -out-root %T/cuda_usm %s --cuda-include-path="%cuda-path/include" --sycl-named-lambda -- -x cuda --cuda-host-only

#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <stdio.h>
#include <cmath>


#define NUM_ELEMENTS 16
const unsigned num_elements = 16;

class TestStruct {
public:
  void test() {}
};

// CHECK: static dpct::constant_memory<TestStruct, 0> t1;
static dpct::constant_memory<TestStruct, 0> t1;

// CHECK: void member_acc(TestStruct t1) {
// CHECK-NEXT:  t1.test();
// CHECK-NEXT:}
void member_acc(TestStruct t1) {
  t1.test();
}
// CHECK: static dpct::constant_memory<float, 1> const_angle(360);
// CHECK: static dpct::constant_memory<float, 2> const_float(NUM_ELEMENTS, num_elements * 2);
static dpct::constant_memory<float, 1> const_angle(360);
static dpct::constant_memory<float, 2> const_float(NUM_ELEMENTS, num_elements * 2);
// CHECK: static dpct::constant_memory<sycl::double2, 0> vec_d;
static dpct::constant_memory<sycl::double2, 0> vec_d;

// CHECK: static dpct::constant_memory<int *, 0> const_ptr;
static dpct::constant_memory<int *, 0> const_ptr;

// CHECK: static dpct::constant_memory<int, 1> const_init(sycl::range<1>(5), {1, 2, 3, 7, 8});
static dpct::constant_memory<int, 1> const_init(sycl::range<1>(5), {1, 2, 3, 7, 8});
// CHECK: static dpct::constant_memory<int, 2> const_init_2d(sycl::range<2>(5, 5), {{[{][{]}}1, 2, 3, 7, 8}, {2, 4, 5, 8, 2}, {4, 7, 8, 0}, {1, 3}, {4, 0, 56}});
static dpct::constant_memory<int, 2> const_init_2d(sycl::range<2>(5, 5), {{1, 2, 3, 7, 8}, {2, 4, 5, 8, 2}, {4, 7, 8, 0}, {1, 3}, {4, 0, 56}});

// CHECK: struct FuncObj {
// CHECK-NEXT: void operator()(float *out, int index, float const *const_angle) {
// CHECK-NEXT:   out[index] = const_angle[index];
struct FuncObj {
  void operator()(float *out, int index, float const *const_angle) {
    out[index] = const_angle[index];
  }
};

// CHECK:void simple_kernel(float *d_array, const sycl::nd_item<3> &[[ITEM:item_ct1]],
// CHECK-NEXT:              float const *const_angle, int * const const_ptr) {
// CHECK-NEXT:  int index;
// CHECK-NEXT:  index = [[ITEM]].get_group(2) * [[ITEM]].get_local_range(2) + [[ITEM]].get_local_id(2);
// CHECK-NEXT:  FuncObj f;
// CHECK-NEXT:  const_ptr[index] = index;
// CHECK-NEXT:  if (index < 360) {
// CHECK-NEXT:    d_array[index] = const_angle[index];
// CHECK-NEXT:  }
// CHECK-NEXT:  f(d_array, index, const_angle);
// CHECK-NEXT:  return;
// CHECK-NEXT:}
void simple_kernel(float *d_array, const sycl::nd_item<3> &item_ct1,
                   float const *const_angle, int * const const_ptr) {
  int index;
  index = item_ct1.get_group(2) * item_ct1.get_local_range(2) + item_ct1.get_local_id(2);
  FuncObj f;
  const_ptr[index] = index;
  if (index < 360) {
    d_array[index] = const_angle[index];
  }
  f(d_array, index, const_angle);
  return;
}

// CHECK: static dpct::constant_memory<float, 0> const_one;
static dpct::constant_memory<float, 0> const_one;

// CHECK:void simple_kernel_one(float *d_array, const sycl::nd_item<3> &[[ITEM:item_ct1]],
// CHECK-NEXT:                  dpct::accessor<float, dpct::constant, 2> const_float,
// CHECK-NEXT:                  float const_one) {
// CHECK-NEXT:  int index;
// CHECK-NEXT:  index = [[ITEM]].get_group(2) * [[ITEM]].get_local_range(2) + [[ITEM]].get_local_id(2);
// CHECK-NEXT:  if (index < 33) {
// CHECK-NEXT:    d_array[index] = const_one + const_float[index][index];
// CHECK-NEXT:  }
// CHECK-NEXT:  return;
// CHECK-NEXT:}
void simple_kernel_one(float *d_array, const sycl::nd_item<3> &item_ct1,
                       dpct::accessor<float, dpct::constant, 2> const_float,
                       float const_one) {
  int index;
  index = item_ct1.get_group(2) * item_ct1.get_local_range(2) + item_ct1.get_local_id(2);
  if (index < 33) {
    d_array[index] = const_one + const_float[index][index];
  }
  return;
}

int main(int argc, char **argv) {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.in_order_queue();
  // CHECK: dpct::device_ext &dev_ct1 = dpct::get_current_device();
  // CHECK-NEXT: sycl::queue &q_ct1 = dev_ct1.in_order_queue();
  int size = 3200;
  float *d_array;
  int *d_int;
  float h_array[360];

  // CHECK: d_array = sycl::malloc_device<float>(size, q_ct1);
  // CHECK-NEXT: d_int = sycl::malloc_device<int>(size, q_ct1);
  d_array = sycl::malloc_device<float>(size, q_ct1);
  d_int = sycl::malloc_device<int>(size, q_ct1);

  // CHECK: q_ct1.memset(d_array, 0, sizeof(float) * size).wait();
  q_ct1.memset(d_array, 0, sizeof(float) * size).wait();

  for (int loop = 0; loop < 360; loop++)
    h_array[loop] = acos(-1.0f) * loop / 180.0f;

  // CHECK:   q_ct1.memcpy(const_ptr.get_ptr(), &d_int, sizeof(int *));
  q_ct1.memcpy(const_ptr.get_ptr(), &d_int, sizeof(int *));
  // CHECK:   q_ct1.memcpy(const_angle.get_ptr(), &h_array[0], sizeof(float) * 360);
  q_ct1.memcpy(const_angle.get_ptr(), &h_array[0], sizeof(float) * 360);

  // CHECK:   q_ct1.memcpy(const_angle.get_ptr() + 3, &h_array[0], sizeof(float) * 357);
  q_ct1.memcpy(const_angle.get_ptr() + 3, &h_array[0], sizeof(float) * 357);

  // CHECK:  q_ct1.memcpy(&h_array[0], const_angle.get_ptr() + 3, sizeof(float) * 357);
  q_ct1.memcpy(&h_array[0], const_angle.get_ptr() + 3, sizeof(float) * 357);

  #define NUM 3
  // CHECK: q_ct1.memcpy(const_angle.get_ptr() + 3+NUM, &h_array[0], sizeof(float) * 354);
  q_ct1.memcpy(const_angle.get_ptr() + 3+NUM, &h_array[0], sizeof(float) * 354);

  // CHECK:  q_ct1.memcpy(&h_array[0], const_angle.get_ptr() + 3+NUM, sizeof(float) * 354);
  q_ct1.memcpy(&h_array[0], const_angle.get_ptr() + 3+NUM, sizeof(float) * 354);

  // CHECK:   q_ct1.submit(
  // CHECK-NEXT:     [&](sycl::handler &cgh) {
  // CHECK-NEXT:       t1.init();
  // CHECK-EMPTY:
  // CHECK-NEXT:       auto t1_ptr_ct1 = t1.get_ptr();
  // CHECK-EMPTY:
  // CHECK-NEXT:       cgh.parallel_for<dpct_kernel_name<class member_acc_{{[a-f0-9]+}}>>(
  // CHECK-NEXT:         sycl::nd_range<3>(sycl::range<3>(1, 1, 1), sycl::range<3>(1, 1, 1)),
  // CHECK-NEXT:         [=](sycl::nd_item<3> item_ct1) {
  // CHECK-NEXT:           member_acc(*t1_ptr_ct1);
  // CHECK-NEXT:         });
  // CHECK-NEXT:     });
  q_ct1.submit(
    [&](sycl::handler &cgh) {
      t1.init();

      auto t1_ptr_ct1 = t1.get_ptr();

      cgh.parallel_for(
        sycl::nd_range<3>(sycl::range<3>(1, 1, 1), sycl::range<3>(1, 1, 1)), 
        [=](sycl::nd_item<3> item_ct1) {
          member_acc(*t1_ptr_ct1);
        });
    });
  // CHECK:   q_ct1.submit(
  // CHECK-NEXT:     [&](sycl::handler &cgh) {
  // CHECK-NEXT:       const_angle.init();
  // CHECK-NEXT:       const_ptr.init();
  // CHECK-EMPTY:
  // CHECK-NEXT:       auto const_angle_ptr_ct1 = const_angle.get_ptr();
  // CHECK-NEXT:       auto const_ptr_ptr_ct1 = const_ptr.get_ptr();
  // CHECK-EMPTY:
  // CHECK-NEXT:       cgh.parallel_for<dpct_kernel_name<class simple_kernel_{{[a-f0-9]+}}>>(
  // CHECK-NEXT:         sycl::nd_range<3>(sycl::range<3>(1, 1, size / 64) * sycl::range<3>(1, 1, 64), sycl::range<3>(1, 1, 64)),
  // CHECK-NEXT:         [=](sycl::nd_item<3> item_ct1) {
  // CHECK-NEXT:           simple_kernel(d_array, item_ct1, const_angle_ptr_ct1, *const_ptr_ptr_ct1);
  // CHECK-NEXT:         });
  // CHECK-NEXT:     });
  q_ct1.submit(
    [&](sycl::handler &cgh) {
      const_angle.init();
      const_ptr.init();

      auto const_angle_ptr_ct1 = const_angle.get_ptr();
      auto const_ptr_ptr_ct1 = const_ptr.get_ptr();

      cgh.parallel_for(
        sycl::nd_range<3>(sycl::range<3>(1, 1, size / 64) * sycl::range<3>(1, 1, 64), sycl::range<3>(1, 1, 64)), 
        [=](sycl::nd_item<3> item_ct1) {
          simple_kernel(d_array, item_ct1, const_angle_ptr_ct1, *const_ptr_ptr_ct1);
        });
    });

  float hangle_h[360];
  // CHECK:  q_ct1.memcpy(hangle_h, d_array, 360 * sizeof(float)).wait();
  q_ct1.memcpy(hangle_h, d_array, 360 * sizeof(float)).wait();
  for (int i = 0; i < 360; i++) {
    if (fabs(h_array[i] - hangle_h[i]) > 1e-5) {
      exit(-1);
    }
  }

  h_array[0] = 10.0f; // Just to test
  // CHECK:  q_ct1.memcpy(const_one.get_ptr(), &h_array[0], sizeof(float) * 1).wait();
  q_ct1.memcpy(const_one.get_ptr(), &h_array[0], sizeof(float) * 1).wait();

  dpct::queue_ptr stream;
  // CHECK:   stream->submit(
  // CHECK-NEXT:     [&](sycl::handler &cgh) {
  // CHECK-NEXT:       const_float.init(*stream);
  // CHECK-NEXT:       const_one.init(*stream);
  // CHECK-EMPTY:
  // CHECK-NEXT:       auto const_one_ptr_ct1 = const_one.get_ptr();
  // CHECK-EMPTY:
  // CHECK-NEXT:       auto const_float_acc_ct1 = const_float.get_access(cgh);
  // CHECK-EMPTY:
  // CHECK-NEXT:       cgh.parallel_for<dpct_kernel_name<class simple_kernel_one_{{[a-f0-9]+}}>>(
  // CHECK-NEXT:         sycl::nd_range<3>(sycl::range<3>(1, 1, size / 64) * sycl::range<3>(1, 1, 64), sycl::range<3>(1, 1, 64)),
  // CHECK-NEXT:         [=](sycl::nd_item<3> item_ct1) {
  // CHECK-NEXT:           simple_kernel_one(d_array, item_ct1, const_float_acc_ct1, *const_one_ptr_ct1);
  // CHECK-NEXT:         });
  // CHECK-NEXT:     });
  stream->submit(
    [&](sycl::handler &cgh) {
      const_float.init(*stream);
      const_one.init(*stream);

      auto const_one_ptr_ct1 = const_one.get_ptr();

      auto const_float_acc_ct1 = const_float.get_access(cgh);

      cgh.parallel_for(
        sycl::nd_range<3>(sycl::range<3>(1, 1, size / 64) * sycl::range<3>(1, 1, 64), sycl::range<3>(1, 1, 64)), 
        [=](sycl::nd_item<3> item_ct1) {
          simple_kernel_one(d_array, item_ct1, const_float_acc_ct1, *const_one_ptr_ct1);
        });
    });

  // CHECK:  q_ct1.memcpy(hangle_h, d_array, 360 * sizeof(float)).wait();
  q_ct1.memcpy(hangle_h, d_array, 360 * sizeof(float)).wait();

  for (int i = 1; i < 360; i++) {
    if (fabs(h_array[i] + 30.0f - hangle_h[i]) > 1e-5) {
      exit(-1);
    }
  }

  sycl::free(d_array, q_ct1);

  printf("Test Passed!\n");
  return 0;
}

//CHECK:static dpct::constant_memory<float, 1> aaa(10);
//CHECK-NEXT:void kernel1(float const *aaa) {
//CHECK-NEXT:  float *a = const_cast<float *>(aaa + 5);
//CHECK-NEXT:}
//CHECK-NEXT:void foo1() {
//CHECK-NEXT:  dpct::get_in_order_queue().submit(
//CHECK-NEXT:    [&](sycl::handler &cgh) {
//CHECK-NEXT:      aaa.init();
//CHECK-EMPTY:
//CHECK-NEXT:      auto aaa_ptr_ct1 = aaa.get_ptr();
//CHECK-EMPTY:
//CHECK-NEXT:      cgh.parallel_for<dpct_kernel_name<class kernel1_{{[a-f0-9]+}}>>(
//CHECK-NEXT:        sycl::nd_range<3>(sycl::range<3>(1, 1, 1), sycl::range<3>(1, 1, 1)),
//CHECK-NEXT:        [=](sycl::nd_item<3> item_ct1) {
//CHECK-NEXT:          kernel1(aaa_ptr_ct1);
//CHECK-NEXT:        });
//CHECK-NEXT:    });
//CHECK-NEXT:}
static dpct::constant_memory<float, 1> aaa(10);
void kernel1(float const *aaa) {
  float *a = const_cast<float *>(aaa + 5);
}
void foo1() {
  dpct::get_in_order_queue().submit(
    [&](sycl::handler &cgh) {
      aaa.init();

      auto aaa_ptr_ct1 = aaa.get_ptr();

      cgh.parallel_for(
        sycl::nd_range<3>(sycl::range<3>(1, 1, 1), sycl::range<3>(1, 1, 1)), 
        [=](sycl::nd_item<3> item_ct1) {
          kernel1(aaa_ptr_ct1);
        });
    });
}