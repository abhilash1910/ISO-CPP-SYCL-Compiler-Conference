#include <oneapi/dpl/execution>
#include <oneapi/dpl/algorithm>
#include <oneapi/dpl/async>
#include <vector>

using namespace oneapi::dpl::experimental::ranges;

int main()
{
    //std::exec
    std::vector<int> data( 1000 );
    std::fill(oneapi::dpl::execution::par_unseq, data.begin(), data.end(), 42);
    
    
    //std::ranges
    const int max_n =512;
    int data1[512], data2[512];
    memset(data1, 16, sizeof(data1));
    memset(data2, 32, sizeof(data2));
    //or data.data()
    sycl::buffer<int> A(data, sycl::range<1>(max_n));
    sycl::buffer<int> B(data2, sycl::range<1>(max_n));

    auto view = all_view(A) | views::reverse();
    auto range_res = all_view<int, sycl::access::mode::write>(B);

    copy(oneapi::dpl::execution::dpcpp_default, view, range_res);
    
    
    //iterator
    oneapi::dpl::counting_iterator<int> first(0);
    oneapi::dpl::counting_iterator<int> last(10);
    auto transform_first = oneapi::dpl::make_transform_iterator(first, std::negate<int>());
    auto transform_last = transform_first + (last - first);
    auto sum = std::reduce(oneapi::dpl::execution::dpcpp_default,
                           transform_first, transform_last);
                           
    //async transform-reduce
    sycl::buffer<int> a{10};
    auto fut1 = oneapi::dpl::experimental::fill_async(oneapi::dpl::execution::dpcpp_default,
                                                  oneapi::dpl::begin(a),oneapi::dpl::end(a),7);
    auto fut2 = oneapi::dpl::experimental::transform_async(oneapi::dpl::execution::dpcpp_default,
                                                       oneapi::dpl::begin(a),oneapi::dpl::end(a),oneapi::dpl::begin(a),
                                                       [&](const int& x){return x + 1; },fut1);
    auto ret_val = oneapi::dpl::experimental::reduce_async(oneapi::dpl::execution::dpcpp_default,
                                                       oneapi::dpl::begin(a),oneapi::dpl::end(a),fut1,fut2).get();   
                        
                           
    
    
    return 0;
}