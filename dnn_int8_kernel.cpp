//Author Abhilash Majumder (abhilash.majumder@intel.com)

#include <stdexcept>

#include "oneapi/dnnl/dnnl.hpp"

#include "example_utils.h"

using namespace dnnl;

void simple_net_int8(engine::kind engine_kind) {
    using tag = memory::format_tag;
    using dt = memory::data_type;

    auto eng = engine(engine_kind, 0);
    stream s(eng);

    const int batch = 8;

    //[Configure tensor shapes]
    // AlexNet: conv3
    // {batch, 256, 13, 13} (x)  {384, 256, 3, 3}; -> {batch, 384, 13, 13}
    // strides: {1, 1}
    memory::dims conv_src_tz = {batch, 256, 13, 13};
    memory::dims conv_weights_tz = {384, 256, 3, 3};
    memory::dims conv_bias_tz = {384};
    memory::dims conv_dst_tz = {batch, 384, 13, 13};
    memory::dims conv_strides = {1, 1};
    memory::dims conv_padding = {1, 1};
    //[Configure tensor shapes]

    //[Choose scaling factors]
    // Choose scaling factors for input, weight and output
    std::vector<float> src_scales = {1.8f};
    std::vector<float> weight_scales = {2.0f};
    std::vector<float> dst_scales = {0.55f};

    //[Choose scaling factors]

    //[Set scaling mask]
    const int src_mask = 0;
    const int weight_mask = 0;
    const int dst_mask = 0;
    //[Set scaling mask]

    // Allocate input and output buffers for user data
    std::vector<float> user_src(batch * 256 * 13 * 13);
    std::vector<float> user_dst(batch * 384 * 13 * 13);

    // Allocate and fill buffers for weights and bias
    std::vector<float> conv_weights(product(conv_weights_tz));
    std::vector<float> conv_bias(product(conv_bias_tz));

    //[Allocate buffers]
    auto user_src_memory = memory({{conv_src_tz}, dt::f32, tag::nchw}, eng);
    write_to_dnnl_memory(user_src.data(), user_src_memory);
    auto user_weights_memory
            = memory({{conv_weights_tz}, dt::f32, tag::oihw}, eng);
    write_to_dnnl_memory(conv_weights.data(), user_weights_memory);
    auto user_bias_memory = memory({{conv_bias_tz}, dt::f32, tag::x}, eng);
    write_to_dnnl_memory(conv_bias.data(), user_bias_memory);
    //[Allocate buffers]

    //[Create convolution memory descriptors]
    auto conv_src_md = memory::desc({conv_src_tz}, dt::u8, tag::any);
    auto conv_bias_md = memory::desc({conv_bias_tz}, dt::s8, tag::any);
    auto conv_weights_md = memory::desc({conv_weights_tz}, dt::s8, tag::any);
    auto conv_dst_md = memory::desc({conv_dst_tz}, dt::u8, tag::any);
    //[Create convolution memory descriptors]

    //[Configure scaling]
    primitive_attr conv_attr;
    conv_attr.set_scales_mask(DNNL_ARG_SRC, src_mask);
    conv_attr.set_scales_mask(DNNL_ARG_WEIGHTS, weight_mask);
    conv_attr.set_scales_mask(DNNL_ARG_DST, dst_mask);

    // Prepare dst scales
    auto dst_scale_md = memory::desc({1}, dt::f32, tag::x);
    auto dst_scale_memory = memory(dst_scale_md, eng);
    write_to_dnnl_memory(dst_scales.data(), dst_scale_memory);
    //[Configure scaling]

    //[Configure post-ops]
    const float ops_alpha = 0.f; // relu negative slope
    const float ops_beta = 0.f;
    post_ops ops;
    ops.append_eltwise(algorithm::eltwise_relu, ops_alpha, ops_beta);
    conv_attr.set_post_ops(ops);
    //[Configure post-ops]

    // check if int8 convolution is supported
    try {
        convolution_forward::primitive_desc(eng, prop_kind::forward,
                algorithm::convolution_direct, conv_src_md, conv_weights_md,
                conv_bias_md, conv_dst_md, conv_strides, conv_padding,
                conv_padding, conv_attr);
    } catch (error &e) {
        if (e.status == dnnl_unimplemented)
            throw example_allows_unimplemented {
                    "No int8 convolution implementation is available for this "
                    "platform.\n"
                    "Please refer to the developer guide for details."};

        // on any other error just re-throw
        throw;
    }

    //[Create convolution primitive descriptor]
    auto conv_prim_desc = convolution_forward::primitive_desc(eng,
            prop_kind::forward, algorithm::convolution_direct, conv_src_md,
            conv_weights_md, conv_bias_md, conv_dst_md, conv_strides,
            conv_padding, conv_padding, conv_attr);
    //[Create convolution primitive descriptor]

    //[Quantize data and weights]
    auto conv_src_memory = memory(conv_prim_desc.src_desc(), eng);
    primitive_attr src_attr;
    src_attr.set_scales_mask(DNNL_ARG_DST, src_mask);
    auto src_scale_md = memory::desc({1}, dt::f32, tag::x);
    auto src_scale_memory = memory(src_scale_md, eng);
    write_to_dnnl_memory(src_scales.data(), src_scale_memory);
    auto src_reorder_pd
            = reorder::primitive_desc(eng, user_src_memory.get_desc(), eng,
                    conv_src_memory.get_desc(), src_attr);
    auto src_reorder = reorder(src_reorder_pd);
    src_reorder.execute(s,
            {{DNNL_ARG_FROM, user_src_memory}, {DNNL_ARG_TO, conv_src_memory},
                    {DNNL_ARG_ATTR_SCALES | DNNL_ARG_DST, src_scale_memory}});

    auto conv_weights_memory = memory(conv_prim_desc.weights_desc(), eng);
    primitive_attr weight_attr;
    weight_attr.set_scales_mask(DNNL_ARG_DST, weight_mask);
    auto wei_scale_md = memory::desc({1}, dt::f32, tag::x);
    auto wei_scale_memory = memory(wei_scale_md, eng);
    write_to_dnnl_memory(weight_scales.data(), wei_scale_memory);
    auto weight_reorder_pd
            = reorder::primitive_desc(eng, user_weights_memory.get_desc(), eng,
                    conv_weights_memory.get_desc(), weight_attr);
    auto weight_reorder = reorder(weight_reorder_pd);
    weight_reorder.execute(s,
            {{DNNL_ARG_FROM, user_weights_memory},
                    {DNNL_ARG_TO, conv_weights_memory},
                    {DNNL_ARG_ATTR_SCALES | DNNL_ARG_DST, wei_scale_memory}});

    auto conv_bias_memory = memory(conv_prim_desc.bias_desc(), eng);
    write_to_dnnl_memory(conv_bias.data(), conv_bias_memory);
    //[Quantize data and weights]

    auto conv_dst_memory = memory(conv_prim_desc.dst_desc(), eng);

    //[Create convolution primitive]
    auto conv = convolution_forward(conv_prim_desc);
    conv.execute(s,
            {{DNNL_ARG_SRC, conv_src_memory},
                    {DNNL_ARG_WEIGHTS, conv_weights_memory},
                    {DNNL_ARG_BIAS, conv_bias_memory},
                    {DNNL_ARG_DST, conv_dst_memory},
                    {DNNL_ARG_ATTR_SCALES | DNNL_ARG_SRC, src_scale_memory},
                    {DNNL_ARG_ATTR_SCALES | DNNL_ARG_WEIGHTS, wei_scale_memory},
                    {DNNL_ARG_ATTR_SCALES | DNNL_ARG_DST, dst_scale_memory}});
    //[Create convolution primitive]

    auto user_dst_memory = memory({{conv_dst_tz}, dt::f32, tag::nchw}, eng);
    write_to_dnnl_memory(user_dst.data(), user_dst_memory);
    primitive_attr dst_attr;
    dst_attr.set_scales_mask(DNNL_ARG_SRC, dst_mask);
    auto dst_reorder_pd
            = reorder::primitive_desc(eng, conv_dst_memory.get_desc(), eng,
                    user_dst_memory.get_desc(), dst_attr);
    auto dst_reorder = reorder(dst_reorder_pd);
    dst_reorder.execute(s,
            {{DNNL_ARG_FROM, conv_dst_memory}, {DNNL_ARG_TO, user_dst_memory},
                    {DNNL_ARG_ATTR_SCALES | DNNL_ARG_SRC, dst_scale_memory}});
    //[Dequantize the result]

    s.wait();
}

int main(int argc, char **argv) {
    return handle_example_errors(
            simple_net_int8, parse_engine_kind(argc, argv));
}