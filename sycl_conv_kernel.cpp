//Author Abhilash Majumder (abhilash.majumder@intel.com)


#include <dpct/dnnl_utils.hpp>
#include <sycl/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>
#include <vector>

// test_feature:engine_ext
// test_feature:memory_desc_ext
// test_feature:convolution_desc
// test_feature:convolution_forward
// test_feature:convolution_forward_ex

template <dpct::library_data_t T> struct dt_trait {
    typedef void type;
};
template <> struct dt_trait<dpct::library_data_t::real_float> {
    typedef float type;
};

template <> struct dt_trait<dpct::library_data_t::real_int32> {
    typedef int type;
};
template <> struct dt_trait<dpct::library_data_t::real_half> {
    typedef float type;
};

template<typename T>
void print_conv(std::vector<T> &host_out){

 for(int i=0;i<host_out.size();i++)
    {
       std::cout<<host_out[i]<<std::endl;
    
    }

}


template <dpct::library_data_t T, typename HT = typename dt_trait<T>::type>
void command_queue() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
    dpct::dnnl::engine_ext handle;
    dpct::dnnl::memory_desc_ext dataTensor, outTensor;
    dpct::dnnl::memory_desc_ext filterTensor;
    handle.create_engine();

    int in = 2, ic = 4, ih = 5, iw = 5;
    int on = 2, oc = 4, oh = 4, ow = 4;
    int fk = 4, fc = 4, fh = 2, fw = 2;
    int ele_num = in * ic * ih * iw;
    int oele_num = on * oc * oh * ow;
    int fele_num = fk *fc * fh * fw;
    dataTensor.set(dpct::dnnl::memory_format_tag::nchw,
                   dpct::library_data_t::real_float, in, ic, ih, iw);
    outTensor.set(dpct::dnnl::memory_format_tag::nchw,
                  dpct::library_data_t::real_float, on, oc, oh, ow);

    int filterdim[4] = {fk, fc, fh, fw};
    filterTensor.set(dpct::dnnl::memory_format_tag::nchw,
                     dpct::library_data_t::real_float, 4, filterdim);

    float *data, *out, *filter;
    std::vector<float> host_data(in * ic * ih * iw, 1.0f);
    std::vector<float> host_out(on * oc * oh * ow, 0.0f);
    std::vector<float> host_filter(fk * fc * fh * fw, 0.0f);

    for(int i = 0; i < in * ic * ih * iw; i++) {
        host_data[i] = i;
    }
    for(int i = 0; i < oele_num; i++) {
        host_out[i] = i;
    }
    for(int i = 0; i < fele_num; i++) {
        host_filter[i] = i;
    }
    data =
        (float *)sycl::malloc_device(sizeof(float) * in * ic * ih * iw, q_ct1);
    out =
        (float *)sycl::malloc_device(sizeof(float) * on * oc * oh * ow, q_ct1);
    filter =
        (float *)sycl::malloc_device(sizeof(float) * fk * fc * fh * fw, q_ct1);

    q_ct1.memcpy(data, host_data.data(), sizeof(float) * in * ic * ih * iw)
        .wait();
    q_ct1.memcpy(out, host_out.data(), sizeof(float) * on * oc * oh * ow)
        .wait();
    q_ct1.memcpy(filter, host_filter.data(), sizeof(float) * fk * fc * fh * fw)
        .wait();

    dpct::dnnl::convolution_desc covdes;
                covdes.set(0, 0, 1, 1, 1, 1);

    size_t size;
    void *workspacesize;
    size = 0;
    workspacesize = (void *)sycl::malloc_device(size, q_ct1);

    float alpha = 2.5f, beta = 1.5f;
    handle.async_convolution_forward(covdes, dnnl::algorithm::convolution_auto, alpha,
                               dataTensor, data, filterTensor, filter, beta,
                               outTensor, out);
    dev_ct1.queues_wait_and_throw();
    q_ct1.memcpy(host_out.data(), out, sizeof(float) * on * oc * oh * ow)
        .wait();

    //sycl::free(data, q_ct1);
    //sycl::free(out, q_ct1);
    
    print_conv<float>(host_out);
}

int main() {
    command_queue<dpct::library_data_t::real_float>();
    
    return 0;
}