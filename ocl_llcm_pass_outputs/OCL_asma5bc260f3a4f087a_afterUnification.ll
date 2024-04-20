; ------------------------------------------------
; OCL_asma5bc260f3a4f087a_afterUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::range" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::detail::array" = type { [3 x i64] }
%class.__generated_ = type { i8 addrspace(1)*, i64, %"class.sycl::_V1::range", i8 addrspace(1)*, i64, %"class.sycl::_V1::range" }
%"class.sycl::_V1::detail::RoundedRangeIDGenerator" = type <{ %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::range", %"class.sycl::_V1::range", i8, [7 x i8] }>
%"class.sycl::_V1::detail::RoundedRangeKernel" = type { %"class.sycl::_V1::range", %class._ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_EUlSB_E_ }
%class._ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_EUlSB_E_ = type { i8 addrspace(4)*, i64, %"class.sycl::_V1::range", i8 addrspace(4)*, i64, %"class.sycl::_V1::range" }
%"class.sycl::_V1::range.0" = type { %"class.sycl::_V1::detail::array.1" }
%"class.sycl::_V1::detail::array.1" = type { [1 x i64] }
%class.__generated_.2 = type <{ i8 addrspace(1)*, i8, [7 x i8] }>
%class.__generated_.9 = type <{ i8 addrspace(1)*, i16, [6 x i8] }>
%class.__generated_.12 = type <{ i8 addrspace(1)*, i32, [4 x i8] }>

@GenSLM.LocalMemPoolOnGetMemPoolPtr = addrspace(3) global [4096 x i8] zeroinitializer, section "localSLM", align 4

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE(%"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %0, %class.__generated_* byval(%class.__generated_) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i64 %const_reg_qword2, i64 %const_reg_qword3, i64 %const_reg_qword4, i64 %const_reg_qword5, i64 %const_reg_qword6, i64 %const_reg_qword7, i64 %const_reg_qword8, i64 %const_reg_qword9, i64 %const_reg_qword10, i64 %const_reg_qword11, i64 %const_reg_qword12) #0 {
  %3 = extractelement <3 x i32> %globalSize, i32 0
  %4 = extractelement <3 x i32> %globalSize, i32 1
  %5 = extractelement <3 x i32> %globalSize, i32 2
  %6 = extractelement <8 x i32> %payloadHeader, i32 0
  %7 = extractelement <8 x i32> %payloadHeader, i32 1
  %8 = extractelement <8 x i32> %payloadHeader, i32 2
  %9 = extractelement <8 x i32> %payloadHeader, i32 3
  %10 = extractelement <8 x i32> %payloadHeader, i32 4
  %11 = extractelement <8 x i32> %payloadHeader, i32 5
  %12 = extractelement <8 x i32> %payloadHeader, i32 6
  %13 = extractelement <8 x i32> %payloadHeader, i32 7
  %14 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %15 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %16 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %17 = extractelement <8 x i32> %r0, i32 0
  %18 = extractelement <8 x i32> %r0, i32 1
  %19 = extractelement <8 x i32> %r0, i32 2
  %20 = extractelement <8 x i32> %r0, i32 3
  %21 = extractelement <8 x i32> %r0, i32 4
  %22 = extractelement <8 x i32> %r0, i32 5
  %23 = extractelement <8 x i32> %r0, i32 6
  %24 = extractelement <8 x i32> %r0, i32 7
  %25 = alloca %"class.sycl::_V1::detail::RoundedRangeIDGenerator", align 8, !spirv.Decorations !489
  %26 = alloca %"class.sycl::_V1::range", align 8, !spirv.Decorations !489
  %27 = alloca %"class.sycl::_V1::detail::RoundedRangeKernel", align 8, !spirv.Decorations !489
  %28 = bitcast %"class.sycl::_V1::detail::RoundedRangeKernel"* %27 to i8*
  call void @llvm.lifetime.start.p0i8(i64 104, i8* nonnull %28)
  %_alloca.sroa.0.0..sroa_idx = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %const_reg_qword, i64* %_alloca.sroa.0.0..sroa_idx, align 8
  %_alloca.sroa.3.0..sroa_idx92 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 0, i32 0, i32 0, i64 1
  store i64 %const_reg_qword1, i64* %_alloca.sroa.3.0..sroa_idx92, align 8
  %_alloca.sroa.4.0..sroa_idx95 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 0, i32 0, i32 0, i64 2
  store i64 %const_reg_qword2, i64* %_alloca.sroa.4.0..sroa_idx95, align 8
  %_alloca80.sroa.0.0..sroa_idx = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1
  %_alloca80.sroa.0.0..sroa_cast = bitcast %class._ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_EUlSB_E_* %_alloca80.sroa.0.0..sroa_idx to i64*
  store i64 %const_reg_qword3, i64* %_alloca80.sroa.0.0..sroa_cast, align 8
  %_alloca80.sroa.2.0..sroa_idx81 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 1
  store i64 %const_reg_qword4, i64* %_alloca80.sroa.2.0..sroa_idx81, align 8
  %_alloca80.sroa.3.0..sroa_idx82 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 2, i32 0, i32 0, i64 0
  store i64 %const_reg_qword5, i64* %_alloca80.sroa.3.0..sroa_idx82, align 8
  %_alloca80.sroa.4.0..sroa_idx83 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 2, i32 0, i32 0, i64 1
  store i64 %const_reg_qword6, i64* %_alloca80.sroa.4.0..sroa_idx83, align 8
  %_alloca80.sroa.5.0..sroa_idx84 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 2, i32 0, i32 0, i64 2
  store i64 %const_reg_qword7, i64* %_alloca80.sroa.5.0..sroa_idx84, align 8
  %_alloca80.sroa.6.0..sroa_idx85 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 3
  %_alloca80.sroa.6.0..sroa_cast = bitcast i8 addrspace(4)** %_alloca80.sroa.6.0..sroa_idx85 to i64*
  store i64 %const_reg_qword8, i64* %_alloca80.sroa.6.0..sroa_cast, align 8
  %_alloca80.sroa.7.0..sroa_idx86 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 4
  store i64 %const_reg_qword9, i64* %_alloca80.sroa.7.0..sroa_idx86, align 8
  %_alloca80.sroa.8.0..sroa_idx87 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 5, i32 0, i32 0, i64 0
  store i64 %const_reg_qword10, i64* %_alloca80.sroa.8.0..sroa_idx87, align 8
  %_alloca80.sroa.9.0..sroa_idx88 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 5, i32 0, i32 0, i64 1
  store i64 %const_reg_qword11, i64* %_alloca80.sroa.9.0..sroa_idx88, align 8
  %_alloca80.sroa.10.0..sroa_idx89 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 5, i32 0, i32 0, i64 2
  store i64 %const_reg_qword12, i64* %_alloca80.sroa.10.0..sroa_idx89, align 8
  %mul.i15.i.i = mul i32 %16, %24
  %localIdZ27 = zext i16 %localIdZ to i32
  %add.i17.i.i = add i32 %mul.i15.i.i, %localIdZ27
  %add4.i19.i.i = add i32 %add.i17.i.i, %8
  %conv.i20.i.i = zext i32 %add4.i19.i.i to i64
  %mul.i7.i.i15 = mul i32 %15, %23
  %localIdY41 = zext i16 %localIdY to i32
  %add.i9.i.i18 = add i32 %mul.i7.i.i15, %localIdY41
  %add4.i11.i.i20 = add i32 %add.i9.i.i18, %7
  %conv.i12.i.i21 = zext i32 %add4.i11.i.i20 to i64
  %mul.i.i.i35 = mul i32 %14, %18
  %localIdX55 = zext i16 %localIdX to i32
  %add.i.i.i38 = add i32 %mul.i.i.i35, %localIdX55
  %add4.i.i.i40 = add i32 %add.i.i.i38, %6
  %conv.i.i.i41 = zext i32 %add4.i.i.i40 to i64
  %conv5.i70 = zext i32 %5 to i64
  %conv2.i76 = zext i32 %4 to i64
  %conv.i = zext i32 %3 to i64
  %29 = bitcast %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25 to i8*
  call void @llvm.lifetime.start.p0i8(i64 104, i8* nonnull %29)
  %30 = bitcast %"class.sycl::_V1::range"* %26 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %30)
  %31 = getelementptr inbounds %"class.sycl::_V1::range", %"class.sycl::_V1::range"* %26, i64 0, i32 0, i32 0, i64 0
  store i64 %conv.i20.i.i, i64* %31, align 8
  %32 = getelementptr inbounds %"class.sycl::_V1::range", %"class.sycl::_V1::range"* %26, i64 0, i32 0, i32 0, i64 1
  store i64 %conv.i12.i.i21, i64* %32, align 8
  %33 = getelementptr inbounds %"class.sycl::_V1::range", %"class.sycl::_V1::range"* %26, i64 0, i32 0, i32 0, i64 2
  store i64 %conv.i.i.i41, i64* %33, align 8
  %34 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  store i64 %conv.i20.i.i, i64* %34, align 8
  %35 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 0, i32 0, i32 0, i64 1
  store i64 %conv.i12.i.i21, i64* %35, align 8
  %36 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 0, i32 0, i32 0, i64 2
  store i64 %conv.i.i.i41, i64* %36, align 8
  %37 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 1, i32 0, i32 0, i64 0
  store i64 %conv.i20.i.i, i64* %37, align 8
  %38 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 1, i32 0, i32 0, i64 1
  store i64 %conv.i12.i.i21, i64* %38, align 8
  %39 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 %conv.i.i.i41, i64* %39, align 8
  %_alloca.sroa.0.0..sroa_idx90 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 2, i32 0, i32 0, i64 0
  store i64 %const_reg_qword, i64* %_alloca.sroa.0.0..sroa_idx90, align 8
  %_alloca.sroa.3.0..sroa_idx93 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 2, i32 0, i32 0, i64 1
  store i64 %const_reg_qword1, i64* %_alloca.sroa.3.0..sroa_idx93, align 8
  %_alloca.sroa.4.0..sroa_idx96 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 2, i32 0, i32 0, i64 2
  store i64 %const_reg_qword2, i64* %_alloca.sroa.4.0..sroa_idx96, align 8
  %40 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 3, i32 0, i32 0, i64 0
  store i64 %conv5.i70, i64* %40, align 8
  %41 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 3, i32 0, i32 0, i64 1
  store i64 %conv2.i76, i64* %41, align 8
  %42 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 3, i32 0, i32 0, i64 2
  store i64 %conv.i, i64* %42, align 8
  br label %43

43:                                               ; preds = %47, %2
  %44 = phi i8 [ 0, %2 ], [ %54, %47 ]
  %45 = phi i32 [ 0, %2 ], [ %55, %47 ]
  %46 = icmp ult i32 %45, 3
  br i1 %46, label %47, label %56

47:                                               ; preds = %43
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds %"class.sycl::_V1::range", %"class.sycl::_V1::range"* %26, i64 0, i32 0, i32 0, i64 %48
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 0, i32 0, i32 0, i64 %48
  %52 = load i64, i64* %51, align 8
  %53 = icmp ult i64 %50, %52
  %54 = select i1 %53, i8 %44, i8 1
  %55 = add nuw nsw i32 %45, 1, !spirv.Decorations !491
  br label %43

56:                                               ; preds = %43
  %57 = bitcast %"class.sycl::_V1::range"* %26 to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %57)
  %58 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 3
  %59 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 4
  %60 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 1
  %61 = load i8 addrspace(4)*, i8 addrspace(4)** %58, align 8
  %62 = load i64, i64* %59, align 8
  %63 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 5, i32 0, i32 0, i64 0
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 0
  %66 = load i8 addrspace(4)*, i8 addrspace(4)** %65, align 8
  %67 = load i64, i64* %60, align 8
  %68 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %27, i64 0, i32 1, i32 2, i32 0, i32 0, i64 0
  %69 = load i64, i64* %68, align 8
  br label %70

70:                                               ; preds = %111, %56
  %71 = phi i8 [ %112, %111 ], [ %44, %56 ]
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %73, label %113

73:                                               ; preds = %70
  %74 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  %75 = load i64, i64* %74, align 8
  %76 = load i64, i64* %35, align 8
  %77 = load i64, i64* %36, align 8
  %78 = icmp ult i64 %75, 2147483648
  call void @llvm.assume(i1 %78)
  %79 = icmp ult i64 %76, 2147483648
  call void @llvm.assume(i1 %79)
  %80 = icmp ult i64 %77, 2147483648
  call void @llvm.assume(i1 %80)
  %81 = mul i64 %77, %62
  %82 = mul i64 %76, %64
  %83 = getelementptr i8, i8 addrspace(4)* %61, i64 %81
  %84 = getelementptr i8, i8 addrspace(4)* %83, i64 %82
  %85 = getelementptr i8, i8 addrspace(4)* %84, i64 %75
  %86 = addrspacecast i8 addrspace(4)* %85 to i8 addrspace(1)*
  %87 = load i8, i8 addrspace(1)* %86, align 1
  %88 = mul i64 %77, %67
  %89 = mul i64 %76, %69
  %90 = getelementptr i8, i8 addrspace(4)* %66, i64 %88
  %91 = getelementptr i8, i8 addrspace(4)* %90, i64 %89
  %92 = getelementptr i8, i8 addrspace(4)* %91, i64 %75
  %93 = addrspacecast i8 addrspace(4)* %92 to i8 addrspace(1)*
  store i8 %87, i8 addrspace(1)* %93, align 1
  br label %94

94:                                               ; preds = %107, %73
  %95 = phi i32 [ 0, %73 ], [ %110, %107 ]
  %96 = icmp ult i32 %95, 3
  br i1 %96, label %97, label %111

97:                                               ; preds = %94
  %98 = zext i32 %95 to i64
  %99 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 3, i32 0, i32 0, i64 %98
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 0, i32 0, i32 0, i64 %98
  %102 = load i64, i64* %101, align 8
  %103 = add i64 %102, %100
  store i64 %103, i64* %101, align 8
  %104 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 2, i32 0, i32 0, i64 %98
  %105 = load i64, i64* %104, align 8
  %106 = icmp ult i64 %103, %105
  br i1 %106, label %111, label %107

107:                                              ; preds = %97
  %108 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25, i64 0, i32 1, i32 0, i32 0, i64 %98
  %109 = load i64, i64* %108, align 8
  store i64 %109, i64* %101, align 8
  %110 = add nuw nsw i32 %95, 1, !spirv.Decorations !491
  br label %94

111:                                              ; preds = %97, %94
  %112 = phi i8 [ 1, %94 ], [ 0, %97 ]
  br label %70

113:                                              ; preds = %70
  %114 = bitcast %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %25 to i8*
  call void @llvm.lifetime.end.p0i8(i64 104, i8* nonnull %114)
  %115 = bitcast %"class.sycl::_V1::detail::RoundedRangeKernel"* %27 to i8*
  call void @llvm.lifetime.end.p0i8(i64 104, i8* nonnull %115)
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #3

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail(i8 addrspace(1)* %0, i64 %1, %"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %2, i8 addrspace(1)* %3, i64 %4, %"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %5, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i64 %const_reg_qword2, i64 %const_reg_qword3, i64 %const_reg_qword4, i64 %const_reg_qword5, i32 %bufferOffset, i32 %bufferOffset6) #0 {
  %7 = extractelement <8 x i32> %payloadHeader, i32 0
  %8 = extractelement <8 x i32> %payloadHeader, i32 1
  %9 = extractelement <8 x i32> %payloadHeader, i32 2
  %10 = extractelement <8 x i32> %payloadHeader, i32 3
  %11 = extractelement <8 x i32> %payloadHeader, i32 4
  %12 = extractelement <8 x i32> %payloadHeader, i32 5
  %13 = extractelement <8 x i32> %payloadHeader, i32 6
  %14 = extractelement <8 x i32> %payloadHeader, i32 7
  %15 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %16 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %17 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %18 = extractelement <8 x i32> %r0, i32 0
  %19 = extractelement <8 x i32> %r0, i32 1
  %20 = extractelement <8 x i32> %r0, i32 2
  %21 = extractelement <8 x i32> %r0, i32 3
  %22 = extractelement <8 x i32> %r0, i32 4
  %23 = extractelement <8 x i32> %r0, i32 5
  %24 = extractelement <8 x i32> %r0, i32 6
  %25 = extractelement <8 x i32> %r0, i32 7
  %mul.i15.i.i25 = mul i32 %17, %25
  %localIdZ21 = zext i16 %localIdZ to i32
  %add.i17.i.i28 = add i32 %mul.i15.i.i25, %localIdZ21
  %add4.i19.i.i30 = add i32 %add.i17.i.i28, %9
  %conv.i20.i.i31 = zext i32 %add4.i19.i.i30 to i64
  %mul.i7.i.i45 = mul i32 %16, %24
  %localIdY35 = zext i16 %localIdY to i32
  %add.i9.i.i48 = add i32 %mul.i7.i.i45, %localIdY35
  %add4.i11.i.i50 = add i32 %add.i9.i.i48, %8
  %conv.i12.i.i51 = zext i32 %add4.i11.i.i50 to i64
  %mul.i.i.i = mul i32 %15, %19
  %localIdX49 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX49
  %add4.i.i.i = add i32 %add.i.i.i, %7
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %26 = icmp sgt i32 %add4.i19.i.i30, -1
  call void @llvm.assume(i1 %26)
  %27 = icmp sgt i32 %add4.i11.i.i50, -1
  call void @llvm.assume(i1 %27)
  %28 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %28)
  %29 = mul i64 %conv.i.i.i, %4
  %30 = mul i64 %conv.i12.i.i51, %const_reg_qword3
  %31 = getelementptr i8, i8 addrspace(1)* %3, i64 %29
  %32 = getelementptr i8, i8 addrspace(1)* %31, i64 %30
  %33 = getelementptr i8, i8 addrspace(1)* %32, i64 %conv.i20.i.i31
  %34 = load i8, i8 addrspace(1)* %33, align 1
  %35 = mul i64 %conv.i.i.i, %1
  %36 = mul i64 %conv.i12.i.i51, %const_reg_qword
  %37 = getelementptr i8, i8 addrspace(1)* %0, i64 %35
  %38 = getelementptr i8, i8 addrspace(1)* %37, i64 %36
  %39 = getelementptr i8, i8 addrspace(1)* %38, i64 %conv.i20.i.i31
  store i8 %34, i8 addrspace(1)* %39, align 1
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.2* byval(%class.__generated_.2) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4, i8 %const_reg_byte5, i8 %const_reg_byte6, i8 %const_reg_byte7, i8 %const_reg_byte8) #0 {
  %3 = extractelement <3 x i32> %globalSize, i32 0
  %4 = extractelement <3 x i32> %globalSize, i32 1
  %5 = extractelement <3 x i32> %globalSize, i32 2
  %6 = extractelement <8 x i32> %payloadHeader, i32 0
  %7 = extractelement <8 x i32> %payloadHeader, i32 1
  %8 = extractelement <8 x i32> %payloadHeader, i32 2
  %9 = extractelement <8 x i32> %payloadHeader, i32 3
  %10 = extractelement <8 x i32> %payloadHeader, i32 4
  %11 = extractelement <8 x i32> %payloadHeader, i32 5
  %12 = extractelement <8 x i32> %payloadHeader, i32 6
  %13 = extractelement <8 x i32> %payloadHeader, i32 7
  %14 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %15 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %16 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %17 = extractelement <8 x i32> %r0, i32 0
  %18 = extractelement <8 x i32> %r0, i32 1
  %19 = extractelement <8 x i32> %r0, i32 2
  %20 = extractelement <8 x i32> %r0, i32 3
  %21 = extractelement <8 x i32> %r0, i32 4
  %22 = extractelement <8 x i32> %r0, i32 5
  %23 = extractelement <8 x i32> %r0, i32 6
  %24 = extractelement <8 x i32> %r0, i32 7
  %25 = inttoptr i64 %const_reg_qword1 to i8 addrspace(4)*
  %mul.i.i.i = mul i32 %14, %18
  %localIdX10 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX10
  %add4.i.i.i = add i32 %add.i.i.i, %6
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %conv.i = zext i32 %3 to i64
  %26 = icmp ult i64 %conv.i.i.i, %const_reg_qword
  br label %27

27:                                               ; preds = %30, %2
  %28 = phi i64 [ %conv.i.i.i, %2 ], [ %36, %30 ]
  %29 = phi i1 [ %26, %2 ], [ %35, %30 ]
  br i1 %29, label %30, label %37

30:                                               ; preds = %27
  %31 = icmp ult i64 %28, 2147483648
  call void @llvm.assume(i1 %31)
  %32 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 %28
  %33 = addrspacecast i8 addrspace(4)* %32 to i8 addrspace(1)*
  store i8 %const_reg_byte, i8 addrspace(1)* %33, align 1
  %34 = add nuw nsw i64 %28, %conv.i
  %35 = icmp ult i64 %34, %const_reg_qword
  %36 = select i1 %35, i64 %34, i64 %conv.i.i.i
  br label %27

37:                                               ; preds = %27
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_(i8 addrspace(1)* %0, i8 zeroext %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i32 0
  %4 = extractelement <8 x i32> %payloadHeader, i32 1
  %5 = extractelement <8 x i32> %payloadHeader, i32 2
  %6 = extractelement <8 x i32> %payloadHeader, i32 3
  %7 = extractelement <8 x i32> %payloadHeader, i32 4
  %8 = extractelement <8 x i32> %payloadHeader, i32 5
  %9 = extractelement <8 x i32> %payloadHeader, i32 6
  %10 = extractelement <8 x i32> %payloadHeader, i32 7
  %11 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %12 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %13 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %14 = extractelement <8 x i32> %r0, i32 0
  %15 = extractelement <8 x i32> %r0, i32 1
  %16 = extractelement <8 x i32> %r0, i32 2
  %17 = extractelement <8 x i32> %r0, i32 3
  %18 = extractelement <8 x i32> %r0, i32 4
  %19 = extractelement <8 x i32> %r0, i32 5
  %20 = extractelement <8 x i32> %r0, i32 6
  %21 = extractelement <8 x i32> %r0, i32 7
  %mul.i.i.i = mul i32 %11, %15
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %22 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %22)
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %conv.i.i.i
  store i8 %1, i8 addrspace(1)* %23, align 1
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.9* byval(%class.__generated_.9) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i16 %const_reg_word, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4, i8 %const_reg_byte5, i8 %const_reg_byte6) #0 {
  %3 = extractelement <3 x i32> %globalSize, i32 0
  %4 = extractelement <3 x i32> %globalSize, i32 1
  %5 = extractelement <3 x i32> %globalSize, i32 2
  %6 = extractelement <8 x i32> %payloadHeader, i32 0
  %7 = extractelement <8 x i32> %payloadHeader, i32 1
  %8 = extractelement <8 x i32> %payloadHeader, i32 2
  %9 = extractelement <8 x i32> %payloadHeader, i32 3
  %10 = extractelement <8 x i32> %payloadHeader, i32 4
  %11 = extractelement <8 x i32> %payloadHeader, i32 5
  %12 = extractelement <8 x i32> %payloadHeader, i32 6
  %13 = extractelement <8 x i32> %payloadHeader, i32 7
  %14 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %15 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %16 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %17 = extractelement <8 x i32> %r0, i32 0
  %18 = extractelement <8 x i32> %r0, i32 1
  %19 = extractelement <8 x i32> %r0, i32 2
  %20 = extractelement <8 x i32> %r0, i32 3
  %21 = extractelement <8 x i32> %r0, i32 4
  %22 = extractelement <8 x i32> %r0, i32 5
  %23 = extractelement <8 x i32> %r0, i32 6
  %24 = extractelement <8 x i32> %r0, i32 7
  %25 = inttoptr i64 %const_reg_qword1 to i16 addrspace(4)*
  %mul.i.i.i = mul i32 %14, %18
  %localIdX8 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX8
  %add4.i.i.i = add i32 %add.i.i.i, %6
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %conv.i = zext i32 %3 to i64
  %26 = icmp ult i64 %conv.i.i.i, %const_reg_qword
  br label %27

27:                                               ; preds = %30, %2
  %28 = phi i64 [ %conv.i.i.i, %2 ], [ %36, %30 ]
  %29 = phi i1 [ %26, %2 ], [ %35, %30 ]
  br i1 %29, label %30, label %37

30:                                               ; preds = %27
  %31 = icmp ult i64 %28, 2147483648
  call void @llvm.assume(i1 %31)
  %32 = getelementptr inbounds i16, i16 addrspace(4)* %25, i64 %28
  %33 = addrspacecast i16 addrspace(4)* %32 to i16 addrspace(1)*
  store i16 %const_reg_word, i16 addrspace(1)* %33, align 2
  %34 = add nuw nsw i64 %28, %conv.i
  %35 = icmp ult i64 %34, %const_reg_qword
  %36 = select i1 %35, i64 %34, i64 %conv.i.i.i
  br label %27

37:                                               ; preds = %27
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_(i16 addrspace(1)* %0, i16 zeroext %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i32 0
  %4 = extractelement <8 x i32> %payloadHeader, i32 1
  %5 = extractelement <8 x i32> %payloadHeader, i32 2
  %6 = extractelement <8 x i32> %payloadHeader, i32 3
  %7 = extractelement <8 x i32> %payloadHeader, i32 4
  %8 = extractelement <8 x i32> %payloadHeader, i32 5
  %9 = extractelement <8 x i32> %payloadHeader, i32 6
  %10 = extractelement <8 x i32> %payloadHeader, i32 7
  %11 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %12 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %13 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %14 = extractelement <8 x i32> %r0, i32 0
  %15 = extractelement <8 x i32> %r0, i32 1
  %16 = extractelement <8 x i32> %r0, i32 2
  %17 = extractelement <8 x i32> %r0, i32 3
  %18 = extractelement <8 x i32> %r0, i32 4
  %19 = extractelement <8 x i32> %r0, i32 5
  %20 = extractelement <8 x i32> %r0, i32 6
  %21 = extractelement <8 x i32> %r0, i32 7
  %mul.i.i.i = mul i32 %11, %15
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %22 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %22)
  %23 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %conv.i.i.i
  store i16 %1, i16 addrspace(1)* %23, align 2
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.12* byval(%class.__generated_.12) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i32 %const_reg_dword, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4) #0 {
  %3 = extractelement <3 x i32> %globalSize, i32 0
  %4 = extractelement <3 x i32> %globalSize, i32 1
  %5 = extractelement <3 x i32> %globalSize, i32 2
  %6 = extractelement <8 x i32> %payloadHeader, i32 0
  %7 = extractelement <8 x i32> %payloadHeader, i32 1
  %8 = extractelement <8 x i32> %payloadHeader, i32 2
  %9 = extractelement <8 x i32> %payloadHeader, i32 3
  %10 = extractelement <8 x i32> %payloadHeader, i32 4
  %11 = extractelement <8 x i32> %payloadHeader, i32 5
  %12 = extractelement <8 x i32> %payloadHeader, i32 6
  %13 = extractelement <8 x i32> %payloadHeader, i32 7
  %14 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %15 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %16 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %17 = extractelement <8 x i32> %r0, i32 0
  %18 = extractelement <8 x i32> %r0, i32 1
  %19 = extractelement <8 x i32> %r0, i32 2
  %20 = extractelement <8 x i32> %r0, i32 3
  %21 = extractelement <8 x i32> %r0, i32 4
  %22 = extractelement <8 x i32> %r0, i32 5
  %23 = extractelement <8 x i32> %r0, i32 6
  %24 = extractelement <8 x i32> %r0, i32 7
  %25 = inttoptr i64 %const_reg_qword1 to i32 addrspace(4)*
  %mul.i.i.i = mul i32 %14, %18
  %localIdX6 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX6
  %add4.i.i.i = add i32 %add.i.i.i, %6
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %conv.i = zext i32 %3 to i64
  %26 = icmp ult i64 %conv.i.i.i, %const_reg_qword
  br label %27

27:                                               ; preds = %30, %2
  %28 = phi i64 [ %conv.i.i.i, %2 ], [ %36, %30 ]
  %29 = phi i1 [ %26, %2 ], [ %35, %30 ]
  br i1 %29, label %30, label %37

30:                                               ; preds = %27
  %31 = icmp ult i64 %28, 2147483648
  call void @llvm.assume(i1 %31)
  %32 = getelementptr inbounds i32, i32 addrspace(4)* %25, i64 %28
  %33 = addrspacecast i32 addrspace(4)* %32 to i32 addrspace(1)*
  store i32 %const_reg_dword, i32 addrspace(1)* %33, align 4
  %34 = add nuw nsw i64 %28, %conv.i
  %35 = icmp ult i64 %34, %const_reg_qword
  %36 = select i1 %35, i64 %34, i64 %conv.i.i.i
  br label %27

37:                                               ; preds = %27
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_(i32 addrspace(1)* %0, i32 %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i32 0
  %4 = extractelement <8 x i32> %payloadHeader, i32 1
  %5 = extractelement <8 x i32> %payloadHeader, i32 2
  %6 = extractelement <8 x i32> %payloadHeader, i32 3
  %7 = extractelement <8 x i32> %payloadHeader, i32 4
  %8 = extractelement <8 x i32> %payloadHeader, i32 5
  %9 = extractelement <8 x i32> %payloadHeader, i32 6
  %10 = extractelement <8 x i32> %payloadHeader, i32 7
  %11 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %12 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %13 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %14 = extractelement <8 x i32> %r0, i32 0
  %15 = extractelement <8 x i32> %r0, i32 1
  %16 = extractelement <8 x i32> %r0, i32 2
  %17 = extractelement <8 x i32> %r0, i32 3
  %18 = extractelement <8 x i32> %r0, i32 4
  %19 = extractelement <8 x i32> %r0, i32 5
  %20 = extractelement <8 x i32> %r0, i32 6
  %21 = extractelement <8 x i32> %r0, i32 7
  %mul.i.i.i = mul i32 %11, %15
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %22 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %22)
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %conv.i.i.i
  store i32 %1, i32 addrspace(1)* %23, align 4
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_(i32 addrspace(1)* %0, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i32 %bufferOffset) #0 {
  %2 = extractelement <3 x i32> %localSize, i32 0
  %3 = extractelement <3 x i32> %localSize, i32 1
  %4 = extractelement <3 x i32> %localSize, i32 2
  %conv.i.i = zext i16 %localIdX to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %conv.i.i
  %6 = load i32, i32 addrspace(1)* %5, align 4
  %7 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %6, i8 0, i32 0)
  %8 = bitcast <8 x i32> %r0 to <32 x i8>
  %9 = extractelement <32 x i8> %8, i32 0
  %10 = extractelement <32 x i8> %8, i32 1
  %11 = extractelement <32 x i8> %8, i32 2
  %12 = extractelement <32 x i8> %8, i32 3
  %13 = extractelement <32 x i8> %8, i32 4
  %14 = extractelement <32 x i8> %8, i32 5
  %15 = extractelement <32 x i8> %8, i32 6
  %16 = extractelement <32 x i8> %8, i32 7
  %17 = extractelement <32 x i8> %8, i32 8
  %18 = extractelement <32 x i8> %8, i32 9
  %19 = extractelement <32 x i8> %8, i32 10
  %20 = extractelement <32 x i8> %8, i32 11
  %21 = extractelement <32 x i8> %8, i32 12
  %22 = extractelement <32 x i8> %8, i32 13
  %23 = extractelement <32 x i8> %8, i32 14
  %24 = extractelement <32 x i8> %8, i32 15
  %25 = extractelement <32 x i8> %8, i32 16
  %26 = extractelement <32 x i8> %8, i32 17
  %27 = extractelement <32 x i8> %8, i32 18
  %28 = extractelement <32 x i8> %8, i32 19
  %29 = extractelement <32 x i8> %8, i32 20
  %30 = extractelement <32 x i8> %8, i32 21
  %31 = extractelement <32 x i8> %8, i32 22
  %32 = extractelement <32 x i8> %8, i32 23
  %33 = extractelement <32 x i8> %8, i32 24
  %34 = extractelement <32 x i8> %8, i32 25
  %35 = extractelement <32 x i8> %8, i32 26
  %36 = extractelement <32 x i8> %8, i32 27
  %37 = extractelement <32 x i8> %8, i32 28
  %38 = extractelement <32 x i8> %8, i32 29
  %39 = extractelement <32 x i8> %8, i32 30
  %40 = extractelement <32 x i8> %8, i32 31
  %localThreadId4 = zext i8 %17 to i32
  %mul.i.i.i.i = mul i32 %3, %2
  %mul3.i.i.i.i = mul i32 %mul.i.i.i.i, %4
  %simdSize = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i.i.i.i = icmp ugt i32 %simdSize, 7
  call void @llvm.assume(i1 %cmp.i.i.i.i) #9
  %cmp1.i.i.i.i = icmp ult i32 %simdSize, 33
  call void @llvm.assume(i1 %cmp1.i.i.i.i) #9
  %add.i1.i.i = add nsw i32 %simdSize, -1
  %sub.i.i.i = add i32 %add.i1.i.i, %mul3.i.i.i.i
  %simdSize14 = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i6.i.i.i = icmp ugt i32 %simdSize14, 7
  call void @llvm.assume(i1 %cmp.i6.i.i.i) #9
  %cmp1.i7.i.i.i = icmp ult i32 %simdSize14, 33
  call void @llvm.assume(i1 %cmp1.i7.i.i.i) #9
  %div.i.i.i = udiv i32 %sub.i.i.i, %simdSize14
  %freeze = freeze i32 %div.i.i.i
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %cmp1.i.i.i = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %cmp1.i.i.i) #9
  %mul.i.i5.i.i = mul i32 %3, %2
  %mul3.i.i7.i.i = mul i32 %mul.i.i5.i.i, %4
  %simdSize15 = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i.i8.i.i = icmp ugt i32 %simdSize15, 7
  call void @llvm.assume(i1 %cmp.i.i8.i.i) #9
  %cmp1.i.i9.i.i = icmp ult i32 %simdSize15, 33
  call void @llvm.assume(i1 %cmp1.i.i9.i.i) #9
  %sub.i10.i.i = add nsw i32 %simdSize15, -1
  %and.i.i.i = and i32 %sub.i10.i.i, %mul3.i.i7.i.i
  %cmp.i.i.i = icmp eq i32 %and.i.i.i, 0
  br i1 %cmp.i.i.i, label %cond.true.i.i.i, label %lor.rhs.i.i.i

lor.rhs.i.i.i:                                    ; preds = %1
  %41 = bitcast <8 x i32> %r0 to <32 x i8>
  %42 = extractelement <32 x i8> %41, i32 0
  %43 = extractelement <32 x i8> %41, i32 1
  %44 = extractelement <32 x i8> %41, i32 2
  %45 = extractelement <32 x i8> %41, i32 3
  %46 = extractelement <32 x i8> %41, i32 4
  %47 = extractelement <32 x i8> %41, i32 5
  %48 = extractelement <32 x i8> %41, i32 6
  %49 = extractelement <32 x i8> %41, i32 7
  %50 = extractelement <32 x i8> %41, i32 8
  %51 = extractelement <32 x i8> %41, i32 9
  %52 = extractelement <32 x i8> %41, i32 10
  %53 = extractelement <32 x i8> %41, i32 11
  %54 = extractelement <32 x i8> %41, i32 12
  %55 = extractelement <32 x i8> %41, i32 13
  %56 = extractelement <32 x i8> %41, i32 14
  %57 = extractelement <32 x i8> %41, i32 15
  %58 = extractelement <32 x i8> %41, i32 16
  %59 = extractelement <32 x i8> %41, i32 17
  %60 = extractelement <32 x i8> %41, i32 18
  %61 = extractelement <32 x i8> %41, i32 19
  %62 = extractelement <32 x i8> %41, i32 20
  %63 = extractelement <32 x i8> %41, i32 21
  %64 = extractelement <32 x i8> %41, i32 22
  %65 = extractelement <32 x i8> %41, i32 23
  %66 = extractelement <32 x i8> %41, i32 24
  %67 = extractelement <32 x i8> %41, i32 25
  %68 = extractelement <32 x i8> %41, i32 26
  %69 = extractelement <32 x i8> %41, i32 27
  %70 = extractelement <32 x i8> %41, i32 28
  %71 = extractelement <32 x i8> %41, i32 29
  %72 = extractelement <32 x i8> %41, i32 30
  %73 = extractelement <32 x i8> %41, i32 31
  %localThreadId1213 = zext i8 %50 to i32
  %simdSize16 = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i.i.i.i.i = icmp ugt i32 %simdSize16, 7
  call void @llvm.assume(i1 %cmp.i.i.i.i.i) #9
  %cmp1.i.i.i.i.i = icmp ult i32 %simdSize16, 33
  call void @llvm.assume(i1 %cmp1.i.i.i.i.i) #9
  %add.i.i.i.i = add i32 %mul3.i.i7.i.i, -1
  %sub.i.i.i.i = add i32 %add.i.i.i.i, %simdSize16
  %simdSize17 = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i6.i.i.i.i = icmp ugt i32 %simdSize17, 7
  call void @llvm.assume(i1 %cmp.i6.i.i.i.i) #9
  %cmp1.i7.i.i.i.i = icmp ult i32 %simdSize17, 33
  call void @llvm.assume(i1 %cmp1.i7.i.i.i.i) #9
  %div.i.i.i.i = udiv i32 %sub.i.i.i.i, %simdSize17
  %freeze20 = freeze i32 %div.i.i.i.i
  %sub4.i.i.i = add nsw i32 %freeze20, -1
  %cmp5.i.i.i = icmp ugt i32 %sub4.i.i.i, %localThreadId1213
  br i1 %cmp5.i.i.i, label %cond.true.i.i.i, label %__builtin_spirv_BuiltInSubgroupSize.exit.i.i

cond.true.i.i.i:                                  ; preds = %lor.rhs.i.i.i, %1
  %simdSize18 = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i11.i.i.i = icmp ugt i32 %simdSize18, 7
  call void @llvm.assume(i1 %cmp.i11.i.i.i) #9
  %cmp1.i12.i.i.i = icmp ult i32 %simdSize18, 33
  call void @llvm.assume(i1 %cmp1.i12.i.i.i) #9
  br label %__builtin_spirv_BuiltInSubgroupSize.exit.i.i

__builtin_spirv_BuiltInSubgroupSize.exit.i.i:     ; preds = %cond.true.i.i.i, %lor.rhs.i.i.i
  %cond.i.i.i = phi i32 [ %simdSize18, %cond.true.i.i.i ], [ %and.i.i.i, %lor.rhs.i.i.i ]
  %simdSize19 = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i12.i.i = icmp ugt i32 %simdSize19, 7
  call void @llvm.assume(i1 %cmp.i12.i.i) #9
  %cmp1.i13.i.i = icmp ult i32 %simdSize19, 33
  call void @llvm.assume(i1 %cmp1.i13.i.i) #9
  %cmp.i.i = icmp eq i16 %simdLaneId16, 0
  br i1 %cmp.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %__builtin_spirv_BuiltInSubgroupSize.exit.i.i
  %idxprom.i.i = zext i8 %17 to i64
  %74 = bitcast [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*
  %arrayidx.i.i = getelementptr inbounds i32, i32 addrspace(3)* %74, i64 %idxprom.i.i
  store i32 %7, i32 addrspace(3)* %arrayidx.i.i, align 4, !tbaa !494
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %if.then.i.i, %__builtin_spirv_BuiltInSubgroupSize.exit.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %mul.i.i = mul nuw nsw i32 %simdSize19, %localThreadId4
  %add.i1.i = add nuw nsw i32 %mul.i.i, %simdLaneId
  %cmp797.i.i = icmp ugt i32 %freeze, %simdSize19
  br i1 %cmp797.i.i, label %while.body.lr.ph.i.i, label %while.end.i.i

while.body.lr.ph.i.i:                             ; preds = %if.end.i.i
  %add8.i.i = add nsw i32 %simdSize19, -1
  %idxprom11.i.i = zext i32 %add.i1.i to i64
  %75 = bitcast [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*
  %arrayidx12.i.i = getelementptr inbounds i32, i32 addrspace(3)* %75, i64 %idxprom11.i.i
  %idxprom18.i.i = zext i8 %17 to i64
  %76 = bitcast [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*
  %arrayidx19.i.i = getelementptr inbounds i32, i32 addrspace(3)* %76, i64 %idxprom18.i.i
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %if.end21.i.i, %while.body.lr.ph.i.i
  %values_num.098.i.i = phi i32 [ %freeze, %while.body.lr.ph.i.i ], [ %freeze21, %if.end21.i.i ]
  %sub.i.i = add i32 %add8.i.i, %values_num.098.i.i
  %div.i.i = udiv i32 %sub.i.i, %simdSize19
  %freeze21 = freeze i32 %div.i.i
  %mul9.i.i = mul i32 %freeze21, %simdSize19
  %cmp10.i.i = icmp ult i32 %add.i1.i, %values_num.098.i.i
  br i1 %cmp10.i.i, label %cond.true.i.i, label %cond.end.i.i

cond.true.i.i:                                    ; preds = %while.body.i.i
  %77 = load i32, i32 addrspace(3)* %arrayidx12.i.i, align 4, !tbaa !494
  br label %cond.end.i.i

cond.end.i.i:                                     ; preds = %cond.true.i.i, %while.body.i.i
  %cond.i.i = phi i32 [ %77, %cond.true.i.i ], [ 0, %while.body.i.i ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %cmp13.i.i = icmp ult i32 %add.i1.i, %mul9.i.i
  br i1 %cmp13.i.i, label %if.then14.i.i, label %if.end21.i.i

if.then14.i.i:                                    ; preds = %cond.end.i.i
  %78 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %cond.i.i, i8 0, i32 0)
  br i1 %cmp.i.i, label %if.then17.i.i, label %if.end21.i.i

if.then17.i.i:                                    ; preds = %if.then14.i.i
  store i32 %78, i32 addrspace(3)* %arrayidx19.i.i, align 4, !tbaa !494
  br label %if.end21.i.i

if.end21.i.i:                                     ; preds = %if.then17.i.i, %if.then14.i.i, %cond.end.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %cmp7.i.i = icmp ugt i32 %freeze21, %simdSize19
  br i1 %cmp7.i.i, label %while.body.i.i, label %while.end.i.i

while.end.i.i:                                    ; preds = %if.end21.i.i, %if.end.i.i
  %values_num.0.lcssa.i.i = phi i32 [ %freeze, %if.end.i.i ], [ %freeze21, %if.end21.i.i ]
  %cmp23.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, %cond.i.i.i
  br i1 %cmp23.i.i, label %if.then24.i.i, label %if.else.i.i

if.then24.i.i:                                    ; preds = %while.end.i.i
  %79 = bitcast [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !494
  %cmp2699.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, 1
  br i1 %cmp2699.i.i, label %for.body.i.i, label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

for.body.i.i:                                     ; preds = %for.body.i.i, %if.then24.i.i
  %s.0101.i.i = phi i32 [ %inc.i.i, %for.body.i.i ], [ 1, %if.then24.i.i ]
  %sg_aggregate.0100.i.i = phi i32 [ %add.i.i.i, %for.body.i.i ], [ %80, %if.then24.i.i ]
  %idxprom27.i.i = zext i32 %s.0101.i.i to i64
  %81 = bitcast [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*
  %arrayidx28.i.i = getelementptr inbounds i32, i32 addrspace(3)* %81, i64 %idxprom27.i.i
  %82 = load i32, i32 addrspace(3)* %arrayidx28.i.i, align 4, !tbaa !494
  %add.i.i.i = add nsw i32 %82, %sg_aggregate.0100.i.i
  %inc.i.i = add nuw nsw i32 %s.0101.i.i, 1
  %cmp26.i.i = icmp ult i32 %inc.i.i, %values_num.0.lcssa.i.i
  br i1 %cmp26.i.i, label %for.body.i.i, label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

if.else.i.i:                                      ; preds = %while.end.i.i
  %cmp31.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, %simdLaneId
  br i1 %cmp31.i.i, label %cond.true32.i.i, label %cond.end36.i.i

cond.true32.i.i:                                  ; preds = %if.else.i.i
  %idxprom33.i.i = zext i16 %simdLaneId16 to i64
  %83 = bitcast [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*
  %arrayidx34.i.i = getelementptr inbounds i32, i32 addrspace(3)* %83, i64 %idxprom33.i.i
  %84 = load i32, i32 addrspace(3)* %arrayidx34.i.i, align 4, !tbaa !494
  br label %cond.end36.i.i

cond.end36.i.i:                                   ; preds = %cond.true32.i.i, %if.else.i.i
  %cond37.i.i = phi i32 [ %84, %cond.true32.i.i ], [ 0, %if.else.i.i ]
  %85 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %cond37.i.i, i8 0, i32 0)
  br label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit:     ; preds = %if.then24.i.i, %for.body.i.i, %cond.end36.i.i
  %result.0.i.i = phi i32 [ %85, %cond.end36.i.i ], [ %80, %if.then24.i.i ], [ %add.i.i.i, %for.body.i.i ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  store i32 %result.0.i.i, i32 addrspace(1)* %5, align 4
  ret void
}

; Function Attrs: convergent
declare spir_func i32 @__builtin_IB_get_simd_size() local_unnamed_addr #4

; Function Attrs: convergent
declare spir_func void @__builtin_IB_memfence(i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_sub_group_reduce_IAdd_i32(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent
declare spir_func i8 addrspace(3)* @__builtin_IB_AllocLocalMemPool(i1 noundef zeroext, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent
declare spir_func void @__builtin_IB_thread_group_barrier() local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_local_size(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_group_id(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_local_id_x() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_local_id_y() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_local_id_z() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_enqueued_local_size(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_global_offset(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_global_size(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare spir_func i32 @__builtin_IB_get_local_thread_id() local_unnamed_addr #5

; Function Attrs: convergent
declare spir_func i32 @__builtin_IB_get_simd_id() local_unnamed_addr #4

; Function Desc: Accumulate all the active lanes
; Output: 
; Arg 0: value
; Arg 1: IGC:WaveOps
; Arg 2: helperLaneMode : 0: not used; 1: helper lanes participatein wave ops, 2: helper lanes do not participate in wave ops.
; Function Attrs: convergent inaccessiblememonly nounwind
declare i32 @llvm.genx.GenISA.WaveAll.i32(i32, i8, i32) #6

; Function Desc: 
; Output: result
; Arg 0: none
; Function Attrs: nounwind readnone
declare i32 @llvm.genx.GenISA.simdSize() #7

; Function Desc: 
; Output: result
; Arg 0: none
; Function Attrs: nounwind readnone
declare i16 @llvm.genx.GenISA.simdLaneId() #7

; Function Desc: 
; Output: 
; Arg 0: Commit Enable
; Arg 1: L3_Flush_RW_Data
; Arg 2: L3_Flush_Constant_Data
; Arg 3: L3_Flush_Texture_Data
; Arg 4: L3_Flush_Instructions
; Arg 5: Fence has global effect
; Arg 6: L1 Invalidate
; Arg 7: L1 Evict
; Function Attrs: convergent nounwind
declare void @llvm.genx.GenISA.memoryfence(i1, i1, i1, i1, i1, i1, i1, i1) #8

; Function Desc: 
; Output: 
; Arg 0: none
; Function Attrs: convergent nounwind
declare void @llvm.genx.GenISA.threadgroupbarrier() #8

attributes #0 = { convergent nounwind "less-precise-fpmad"="true" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #4 = { convergent "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { convergent inaccessiblememonly nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { convergent nounwind }
attributes #9 = { nounwind }

!IGCMetadata = !{!0}
!igc.functions = !{!400, !437, !451, !469, !472, !476, !477, !481, !482}
!opencl.ocl.version = !{!486, !486, !486, !486, !486}
!opencl.spir.version = !{!486, !486, !486, !486, !486}
!llvm.ident = !{!487, !487, !487, !487, !487}
!llvm.module.flags = !{!488}

!0 = !{!"ModuleMD", !1, !2, !70, !268, !298, !314, !331, !341, !343, !344, !357, !358, !359, !360, !364, !365, !366, !367, !368, !369, !370, !371, !372, !373, !374, !375, !376, !377, !379, !383, !384, !385, !386, !387, !388, !389, !390, !141, !391, !392, !393, !395, !398, !399}
!1 = !{!"isPrecise", i1 false}
!2 = !{!"compOpt", !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69}
!3 = !{!"DenormsAreZero", i1 false}
!4 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!5 = !{!"OptDisable", i1 false}
!6 = !{!"MadEnable", i1 true}
!7 = !{!"NoSignedZeros", i1 false}
!8 = !{!"NoNaNs", i1 false}
!9 = !{!"FloatRoundingMode", i32 0}
!10 = !{!"FloatCvtIntRoundingMode", i32 3}
!11 = !{!"LoadCacheDefault", i32 4}
!12 = !{!"StoreCacheDefault", i32 2}
!13 = !{!"VISAPreSchedRPThreshold", i32 0}
!14 = !{!"SetLoopUnrollThreshold", i32 0}
!15 = !{!"UnsafeMathOptimizations", i1 false}
!16 = !{!"disableCustomUnsafeOpts", i1 false}
!17 = !{!"disableReducePow", i1 false}
!18 = !{!"FiniteMathOnly", i1 false}
!19 = !{!"FastRelaxedMath", i1 false}
!20 = !{!"DashGSpecified", i1 false}
!21 = !{!"FastCompilation", i1 false}
!22 = !{!"UseScratchSpacePrivateMemory", i1 true}
!23 = !{!"RelaxedBuiltins", i1 false}
!24 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!25 = !{!"GreaterThan2GBBufferRequired", i1 true}
!26 = !{!"GreaterThan4GBBufferRequired", i1 true}
!27 = !{!"DisableA64WA", i1 false}
!28 = !{!"ForceEnableA64WA", i1 false}
!29 = !{!"PushConstantsEnable", i1 true}
!30 = !{!"HasPositivePointerOffset", i1 false}
!31 = !{!"HasBufferOffsetArg", i1 true}
!32 = !{!"BufferOffsetArgOptional", i1 true}
!33 = !{!"replaceGlobalOffsetsByZero", i1 false}
!34 = !{!"forcePixelShaderSIMDMode", i32 0}
!35 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!36 = !{!"UniformWGS", i1 false}
!37 = !{!"disableVertexComponentPacking", i1 false}
!38 = !{!"disablePartialVertexComponentPacking", i1 false}
!39 = !{!"PreferBindlessImages", i1 false}
!40 = !{!"UseBindlessMode", i1 false}
!41 = !{!"UseLegacyBindlessMode", i1 true}
!42 = !{!"disableMathRefactoring", i1 false}
!43 = !{!"atomicBranch", i1 false}
!44 = !{!"ForceInt32DivRemEmu", i1 false}
!45 = !{!"ForceInt32DivRemEmuSP", i1 false}
!46 = !{!"DisableFastestSingleCSSIMD", i1 false}
!47 = !{!"DisableFastestLinearScan", i1 false}
!48 = !{!"UseStatelessforPrivateMemory", i1 false}
!49 = !{!"EnableTakeGlobalAddress", i1 false}
!50 = !{!"IsLibraryCompilation", i1 false}
!51 = !{!"FastVISACompile", i1 false}
!52 = !{!"MatchSinCosPi", i1 false}
!53 = !{!"ExcludeIRFromZEBinary", i1 false}
!54 = !{!"EmitZeBinVISASections", i1 false}
!55 = !{!"FP64GenEmulationEnabled", i1 false}
!56 = !{!"allowDisableRematforCS", i1 false}
!57 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!58 = !{!"DisableCPSOmaskWA", i1 false}
!59 = !{!"DisableFastestGopt", i1 false}
!60 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!61 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!62 = !{!"DisableConstantCoalescing", i1 false}
!63 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!64 = !{!"WaEnableALTModeVisaWA", i1 false}
!65 = !{!"NewSpillCostFunction", i1 false}
!66 = !{!"ForceLargeGRFNum4RQ", i1 false}
!67 = !{!"DisableEUFusion", i1 false}
!68 = !{!"DisableFDivToFMulInvOpt", i1 false}
!69 = !{!"initializePhiSampleSourceWA", i1 false}
!70 = !{!"FuncMD", !71, !72, !168, !169, !203, !204, !215, !216, !224, !225, !232, !233, !240, !241, !248, !249, !256, !257}
!71 = !{!"FuncMDMap[0]", void (%"class.sycl::_V1::range"*, %class.__generated_*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE}
!72 = !{!"FuncMDValue[0]", !73, !74, !78, !79, !80, !101, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !154, !157, !160, !163, !164, !167}
!73 = !{!"localOffsets"}
!74 = !{!"workGroupWalkOrder", !75, !76, !77}
!75 = !{!"dim0", i32 0}
!76 = !{!"dim1", i32 0}
!77 = !{!"dim2", i32 0}
!78 = !{!"funcArgs"}
!79 = !{!"functionType", !"KernelFunction"}
!80 = !{!"rtInfo", !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !100}
!81 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!82 = !{!"isContinuation", i1 false}
!83 = !{!"hasTraceRayPayload", i1 false}
!84 = !{!"hasHitAttributes", i1 false}
!85 = !{!"hasCallableData", i1 false}
!86 = !{!"ShaderStackSize", i32 0}
!87 = !{!"ShaderHash", i64 0}
!88 = !{!"ShaderName", !""}
!89 = !{!"ParentName", !""}
!90 = !{!"SlotNum", i1* null}
!91 = !{!"NOSSize", i32 0}
!92 = !{!"globalRootSignatureSize", i32 0}
!93 = !{!"Entries"}
!94 = !{!"SpillUnions"}
!95 = !{!"CustomHitAttrSizeInBytes", i32 0}
!96 = !{!"Types", !97, !98, !99}
!97 = !{!"FrameStartTys"}
!98 = !{!"ArgumentTys"}
!99 = !{!"FullFrameTys"}
!100 = !{!"Aliases"}
!101 = !{!"resAllocMD", !102, !103, !104, !105, !132}
!102 = !{!"uavsNumType", i32 0}
!103 = !{!"srvsNumType", i32 0}
!104 = !{!"samplersNumType", i32 0}
!105 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131}
!106 = !{!"argAllocMDListVec[0]", !107, !108, !109}
!107 = !{!"type", i32 0}
!108 = !{!"extensionType", i32 -1}
!109 = !{!"indexType", i32 -1}
!110 = !{!"argAllocMDListVec[1]", !107, !108, !109}
!111 = !{!"argAllocMDListVec[2]", !107, !108, !109}
!112 = !{!"argAllocMDListVec[3]", !107, !108, !109}
!113 = !{!"argAllocMDListVec[4]", !107, !108, !109}
!114 = !{!"argAllocMDListVec[5]", !107, !108, !109}
!115 = !{!"argAllocMDListVec[6]", !107, !108, !109}
!116 = !{!"argAllocMDListVec[7]", !107, !108, !109}
!117 = !{!"argAllocMDListVec[8]", !107, !108, !109}
!118 = !{!"argAllocMDListVec[9]", !107, !108, !109}
!119 = !{!"argAllocMDListVec[10]", !107, !108, !109}
!120 = !{!"argAllocMDListVec[11]", !107, !108, !109}
!121 = !{!"argAllocMDListVec[12]", !107, !108, !109}
!122 = !{!"argAllocMDListVec[13]", !107, !108, !109}
!123 = !{!"argAllocMDListVec[14]", !107, !108, !109}
!124 = !{!"argAllocMDListVec[15]", !107, !108, !109}
!125 = !{!"argAllocMDListVec[16]", !107, !108, !109}
!126 = !{!"argAllocMDListVec[17]", !107, !108, !109}
!127 = !{!"argAllocMDListVec[18]", !107, !108, !109}
!128 = !{!"argAllocMDListVec[19]", !107, !108, !109}
!129 = !{!"argAllocMDListVec[20]", !107, !108, !109}
!130 = !{!"argAllocMDListVec[21]", !107, !108, !109}
!131 = !{!"argAllocMDListVec[22]", !107, !108, !109}
!132 = !{!"inlineSamplersMD"}
!133 = !{!"maxByteOffsets"}
!134 = !{!"IsInitializer", i1 false}
!135 = !{!"IsFinalizer", i1 false}
!136 = !{!"CompiledSubGroupsNumber", i32 0}
!137 = !{!"hasInlineVmeSamplers", i1 false}
!138 = !{!"localSize", i32 0}
!139 = !{!"localIDPresent", i1 false}
!140 = !{!"groupIDPresent", i1 false}
!141 = !{!"privateMemoryPerWI", i32 0}
!142 = !{!"globalIDPresent", i1 false}
!143 = !{!"hasSyncRTCalls", i1 false}
!144 = !{!"hasNonKernelArgLoad", i1 false}
!145 = !{!"hasNonKernelArgStore", i1 false}
!146 = !{!"hasNonKernelArgAtomic", i1 false}
!147 = !{!"UserAnnotations"}
!148 = !{!"m_OpenCLArgAddressSpaces", !149, !150}
!149 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 0}
!150 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 0}
!151 = !{!"m_OpenCLArgAccessQualifiers", !152, !153}
!152 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!153 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!154 = !{!"m_OpenCLArgTypes", !155, !156}
!155 = !{!"m_OpenCLArgTypesVec[0]", !"class.sycl::_V1::range"}
!156 = !{!"m_OpenCLArgTypesVec[1]", !"class.__generated_"}
!157 = !{!"m_OpenCLArgBaseTypes", !158, !159}
!158 = !{!"m_OpenCLArgBaseTypesVec[0]", !"class.sycl::_V1::range"}
!159 = !{!"m_OpenCLArgBaseTypesVec[1]", !"class.__generated_"}
!160 = !{!"m_OpenCLArgTypeQualifiers", !161, !162}
!161 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!162 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!163 = !{!"m_OpenCLArgNames"}
!164 = !{!"m_OpenCLArgScalarAsPointers", !165, !166}
!165 = !{!"m_OpenCLArgScalarAsPointersSet[0]", i32 13}
!166 = !{!"m_OpenCLArgScalarAsPointersSet[1]", i32 18}
!167 = !{!"m_OptsToDisablePerFunc"}
!168 = !{!"FuncMDMap[1]", void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i32, i32)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail}
!169 = !{!"FuncMDValue[1]", !73, !74, !78, !79, !80, !170, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !172, !178, !183, !190, !197, !163, !202, !167}
!170 = !{!"resAllocMD", !102, !103, !104, !171, !132}
!171 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129}
!172 = !{!"m_OpenCLArgAddressSpaces", !173, !150, !174, !175, !176, !177}
!173 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 1}
!174 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 0}
!175 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 1}
!176 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 0}
!177 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 0}
!178 = !{!"m_OpenCLArgAccessQualifiers", !152, !153, !179, !180, !181, !182}
!179 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!180 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!181 = !{!"m_OpenCLArgAccessQualifiersVec[4]", !"none"}
!182 = !{!"m_OpenCLArgAccessQualifiersVec[5]", !"none"}
!183 = !{!"m_OpenCLArgTypes", !184, !185, !186, !187, !188, !189}
!184 = !{!"m_OpenCLArgTypesVec[0]", !"char*"}
!185 = !{!"m_OpenCLArgTypesVec[1]", !"long"}
!186 = !{!"m_OpenCLArgTypesVec[2]", !"class.sycl::_V1::range"}
!187 = !{!"m_OpenCLArgTypesVec[3]", !"char*"}
!188 = !{!"m_OpenCLArgTypesVec[4]", !"long"}
!189 = !{!"m_OpenCLArgTypesVec[5]", !"class.sycl::_V1::range"}
!190 = !{!"m_OpenCLArgBaseTypes", !191, !192, !193, !194, !195, !196}
!191 = !{!"m_OpenCLArgBaseTypesVec[0]", !"char*"}
!192 = !{!"m_OpenCLArgBaseTypesVec[1]", !"long"}
!193 = !{!"m_OpenCLArgBaseTypesVec[2]", !"class.sycl::_V1::range"}
!194 = !{!"m_OpenCLArgBaseTypesVec[3]", !"char*"}
!195 = !{!"m_OpenCLArgBaseTypesVec[4]", !"long"}
!196 = !{!"m_OpenCLArgBaseTypesVec[5]", !"class.sycl::_V1::range"}
!197 = !{!"m_OpenCLArgTypeQualifiers", !161, !162, !198, !199, !200, !201}
!198 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!199 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!200 = !{!"m_OpenCLArgTypeQualifiersVec[4]", !""}
!201 = !{!"m_OpenCLArgTypeQualifiersVec[5]", !""}
!202 = !{!"m_OpenCLArgScalarAsPointers"}
!203 = !{!"FuncMDMap[2]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i8, i8, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!204 = !{!"FuncMDValue[2]", !73, !74, !78, !79, !80, !205, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !207, !210, !160, !163, !213, !167}
!205 = !{!"resAllocMD", !102, !103, !104, !206, !132}
!206 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128}
!207 = !{!"m_OpenCLArgTypes", !208, !209}
!208 = !{!"m_OpenCLArgTypesVec[0]", !"class.sycl::_V1::range.0"}
!209 = !{!"m_OpenCLArgTypesVec[1]", !"class.__generated_.2"}
!210 = !{!"m_OpenCLArgBaseTypes", !211, !212}
!211 = !{!"m_OpenCLArgBaseTypesVec[0]", !"class.sycl::_V1::range.0"}
!212 = !{!"m_OpenCLArgBaseTypesVec[1]", !"class.__generated_.2"}
!213 = !{!"m_OpenCLArgScalarAsPointers", !214}
!214 = !{!"m_OpenCLArgScalarAsPointersSet[0]", i32 11}
!215 = !{!"FuncMDMap[3]", void (i8 addrspace(1)*, i8, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!216 = !{!"FuncMDValue[3]", !73, !74, !78, !79, !80, !217, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !219, !151, !220, !222, !160, !163, !202, !167}
!217 = !{!"resAllocMD", !102, !103, !104, !218, !132}
!218 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117}
!219 = !{!"m_OpenCLArgAddressSpaces", !173, !150}
!220 = !{!"m_OpenCLArgTypes", !184, !221}
!221 = !{!"m_OpenCLArgTypesVec[1]", !"uchar"}
!222 = !{!"m_OpenCLArgBaseTypes", !191, !223}
!223 = !{!"m_OpenCLArgBaseTypesVec[1]", !"uchar"}
!224 = !{!"FuncMDMap[4]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i16, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!225 = !{!"FuncMDValue[4]", !73, !74, !78, !79, !80, !226, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !228, !230, !160, !163, !213, !167}
!226 = !{!"resAllocMD", !102, !103, !104, !227, !132}
!227 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127}
!228 = !{!"m_OpenCLArgTypes", !208, !229}
!229 = !{!"m_OpenCLArgTypesVec[1]", !"class.__generated_.9"}
!230 = !{!"m_OpenCLArgBaseTypes", !211, !231}
!231 = !{!"m_OpenCLArgBaseTypesVec[1]", !"class.__generated_.9"}
!232 = !{!"FuncMDMap[5]", void (i16 addrspace(1)*, i16, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!233 = !{!"FuncMDValue[5]", !73, !74, !78, !79, !80, !217, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !219, !151, !234, !237, !160, !163, !202, !167}
!234 = !{!"m_OpenCLArgTypes", !235, !236}
!235 = !{!"m_OpenCLArgTypesVec[0]", !"short*"}
!236 = !{!"m_OpenCLArgTypesVec[1]", !"ushort"}
!237 = !{!"m_OpenCLArgBaseTypes", !238, !239}
!238 = !{!"m_OpenCLArgBaseTypesVec[0]", !"short*"}
!239 = !{!"m_OpenCLArgBaseTypesVec[1]", !"ushort"}
!240 = !{!"FuncMDMap[6]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i32, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!241 = !{!"FuncMDValue[6]", !73, !74, !78, !79, !80, !242, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !244, !246, !160, !163, !213, !167}
!242 = !{!"resAllocMD", !102, !103, !104, !243, !132}
!243 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125}
!244 = !{!"m_OpenCLArgTypes", !208, !245}
!245 = !{!"m_OpenCLArgTypesVec[1]", !"class.__generated_.12"}
!246 = !{!"m_OpenCLArgBaseTypes", !211, !247}
!247 = !{!"m_OpenCLArgBaseTypesVec[1]", !"class.__generated_.12"}
!248 = !{!"FuncMDMap[7]", void (i32 addrspace(1)*, i32, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!249 = !{!"FuncMDValue[7]", !73, !74, !78, !79, !80, !217, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !219, !151, !250, !253, !160, !163, !202, !167}
!250 = !{!"m_OpenCLArgTypes", !251, !252}
!251 = !{!"m_OpenCLArgTypesVec[0]", !"int*"}
!252 = !{!"m_OpenCLArgTypesVec[1]", !"int"}
!253 = !{!"m_OpenCLArgBaseTypes", !254, !255}
!254 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int*"}
!255 = !{!"m_OpenCLArgBaseTypesVec[1]", !"int"}
!256 = !{!"FuncMDMap[8]", void (i32 addrspace(1)*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i32)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_}
!257 = !{!"FuncMDValue[8]", !258, !74, !78, !79, !80, !217, !133, !134, !135, !136, !137, !262, !139, !140, !141, !142, !143, !144, !145, !146, !147, !263, !264, !265, !266, !267, !163, !202, !167}
!258 = !{!"localOffsets", !259}
!259 = !{!"localOffsetsVec[0]", !260, !261}
!260 = !{!"m_Offset", i32 0}
!261 = !{!"m_Var", [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr}
!262 = !{!"localSize", i32 4096}
!263 = !{!"m_OpenCLArgAddressSpaces", !173}
!264 = !{!"m_OpenCLArgAccessQualifiers", !152}
!265 = !{!"m_OpenCLArgTypes", !251}
!266 = !{!"m_OpenCLArgBaseTypes", !254}
!267 = !{!"m_OpenCLArgTypeQualifiers", !161}
!268 = !{!"pushInfo", !269, !270, !271, !274, !275, !276, !277, !278, !279, !280, !281, !294, !295, !296, !297}
!269 = !{!"pushableAddresses"}
!270 = !{!"bindlessPushInfo"}
!271 = !{!"dynamicBufferInfo", !272, !273}
!272 = !{!"firstIndex", i32 0}
!273 = !{!"numOffsets", i32 0}
!274 = !{!"MaxNumberOfPushedBuffers", i32 0}
!275 = !{!"inlineConstantBufferSlot", i32 -1}
!276 = !{!"inlineConstantBufferOffset", i32 -1}
!277 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!278 = !{!"constants"}
!279 = !{!"inputs"}
!280 = !{!"constantReg"}
!281 = !{!"simplePushInfoArr", !282, !291, !292, !293}
!282 = !{!"simplePushInfoArrVec[0]", !283, !284, !285, !286, !287, !288, !289, !290}
!283 = !{!"cbIdx", i32 0}
!284 = !{!"pushableAddressGrfOffset", i32 -1}
!285 = !{!"pushableOffsetGrfOffset", i32 -1}
!286 = !{!"offset", i32 0}
!287 = !{!"size", i32 0}
!288 = !{!"isStateless", i1 false}
!289 = !{!"isBindless", i1 false}
!290 = !{!"simplePushLoads"}
!291 = !{!"simplePushInfoArrVec[1]", !283, !284, !285, !286, !287, !288, !289, !290}
!292 = !{!"simplePushInfoArrVec[2]", !283, !284, !285, !286, !287, !288, !289, !290}
!293 = !{!"simplePushInfoArrVec[3]", !283, !284, !285, !286, !287, !288, !289, !290}
!294 = !{!"simplePushBufferUsed", i32 0}
!295 = !{!"pushAnalysisWIInfos"}
!296 = !{!"inlineRTGlobalPtrOffset", i32 0}
!297 = !{!"rtSyncSurfPtrOffset", i32 0}
!298 = !{!"psInfo", !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313}
!299 = !{!"BlendStateDisabledMask", i8 0}
!300 = !{!"SkipSrc0Alpha", i1 false}
!301 = !{!"DualSourceBlendingDisabled", i1 false}
!302 = !{!"ForceEnableSimd32", i1 false}
!303 = !{!"outputDepth", i1 false}
!304 = !{!"outputStencil", i1 false}
!305 = !{!"outputMask", i1 false}
!306 = !{!"blendToFillEnabled", i1 false}
!307 = !{!"forceEarlyZ", i1 false}
!308 = !{!"hasVersionedLoop", i1 false}
!309 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!310 = !{!"NumSamples", i8 0}
!311 = !{!"blendOptimizationMode"}
!312 = !{!"colorOutputMask"}
!313 = !{!"WaDisableVRS", i1 false}
!314 = !{!"csInfo", !315, !316, !317, !318, !319, !13, !14, !320, !321, !322, !323, !324, !325, !326, !327, !43, !328, !329, !330}
!315 = !{!"maxWorkGroupSize", i32 0}
!316 = !{!"waveSize", i32 0}
!317 = !{!"ComputeShaderSecondCompile"}
!318 = !{!"forcedSIMDSize", i8 0}
!319 = !{!"forceTotalGRFNum", i32 0}
!320 = !{!"allowLowerSimd", i1 false}
!321 = !{!"disableSimd32Slicing", i1 false}
!322 = !{!"disableSplitOnSpill", i1 false}
!323 = !{!"forcedVISAPreRAScheduler", i1 false}
!324 = !{!"disableLocalIdOrderOptimizations", i1 false}
!325 = !{!"disableDispatchAlongY", i1 false}
!326 = !{!"neededThreadIdLayout", i1* null}
!327 = !{!"forceTileYWalk", i1 false}
!328 = !{!"walkOrderEnabled", i1 false}
!329 = !{!"walkOrderOverride", i32 0}
!330 = !{!"ResForHfPacking"}
!331 = !{!"msInfo", !332, !333, !334, !335, !336, !337, !338, !339, !340}
!332 = !{!"PrimitiveTopology", i32 3}
!333 = !{!"MaxNumOfPrimitives", i32 0}
!334 = !{!"MaxNumOfVertices", i32 0}
!335 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!336 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!337 = !{!"WorkGroupSize", i32 0}
!338 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!339 = !{!"IndexFormat", i32 6}
!340 = !{!"SubgroupSize", i32 0}
!341 = !{!"taskInfo", !342, !337, !338, !340}
!342 = !{!"MaxNumOfOutputs", i32 0}
!343 = !{!"NBarrierCnt", i32 0}
!344 = !{!"rtInfo", !345, !346, !347, !348, !349, !350, !351, !352, !353, !354, !355, !356}
!345 = !{!"RayQueryAllocSizeInBytes", i32 0}
!346 = !{!"NumContinuations", i32 0}
!347 = !{!"RTAsyncStackAddrspace", i32 -1}
!348 = !{!"RTAsyncStackSurfaceStateOffset", i1* null}
!349 = !{!"SWHotZoneAddrspace", i32 -1}
!350 = !{!"SWHotZoneSurfaceStateOffset", i1* null}
!351 = !{!"SWStackAddrspace", i32 -1}
!352 = !{!"SWStackSurfaceStateOffset", i1* null}
!353 = !{!"RTSyncStackAddrspace", i32 -1}
!354 = !{!"RTSyncStackSurfaceStateOffset", i1* null}
!355 = !{!"doSyncDispatchRays", i1 false}
!356 = !{!"MemStyle", !"Xe"}
!357 = !{!"CurUniqueIndirectIdx", i32 0}
!358 = !{!"inlineDynTextures"}
!359 = !{!"inlineResInfoData"}
!360 = !{!"immConstant", !361, !362, !363}
!361 = !{!"data"}
!362 = !{!"sizes"}
!363 = !{!"zeroIdxs"}
!364 = !{!"stringConstants"}
!365 = !{!"inlineConstantBuffers"}
!366 = !{!"inlineGlobalBuffers"}
!367 = !{!"GlobalPointerProgramBinaryInfos"}
!368 = !{!"ConstantPointerProgramBinaryInfos"}
!369 = !{!"GlobalBufferAddressRelocInfo"}
!370 = !{!"ConstantBufferAddressRelocInfo"}
!371 = !{!"forceLscCacheList"}
!372 = !{!"SrvMap"}
!373 = !{!"RasterizerOrderedByteAddressBuffer"}
!374 = !{!"RasterizerOrderedViews"}
!375 = !{!"MinNOSPushConstantSize", i32 0}
!376 = !{!"inlineProgramScopeOffsets"}
!377 = !{!"shaderData", !378}
!378 = !{!"numReplicas", i32 0}
!379 = !{!"URBInfo", !380, !381, !382}
!380 = !{!"has64BVertexHeaderInput", i1 false}
!381 = !{!"has64BVertexHeaderOutput", i1 false}
!382 = !{!"hasVertexHeader", i1 true}
!383 = !{!"UseBindlessImage", i1 false}
!384 = !{!"enableRangeReduce", i1 false}
!385 = !{!"allowMatchMadOptimizationforVS", i1 false}
!386 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!387 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!388 = !{!"statefulResourcesNotAliased", i1 false}
!389 = !{!"disableMixMode", i1 false}
!390 = !{!"genericAccessesResolved", i1 false}
!391 = !{!"PrivateMemoryPerFG"}
!392 = !{!"m_OptsToDisable"}
!393 = !{!"capabilities", !394}
!394 = !{!"globalVariableDecorationsINTEL", i1 false}
!395 = !{!"m_ShaderResourceViewMcsMask", !396, !397}
!396 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!397 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!398 = !{!"computedDepthMode", i32 0}
!399 = !{!"isHDCFastClearShader", i1 false}
!400 = !{void (%"class.sycl::_V1::range"*, %class.__generated_*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE, !401}
!401 = !{!402, !403}
!402 = !{!"function_type", i32 0}
!403 = !{!"implicit_arg_desc", !404, !405, !406, !407, !408, !409, !410, !411, !412, !415, !417, !419, !421, !422, !423, !425, !427, !429, !431, !433, !435}
!404 = !{i32 0}
!405 = !{i32 1}
!406 = !{i32 4}
!407 = !{i32 6}
!408 = !{i32 7}
!409 = !{i32 8}
!410 = !{i32 9}
!411 = !{i32 12}
!412 = !{i32 16, !413, !414}
!413 = !{!"explicit_arg_num", i32 0}
!414 = !{!"struct_arg_offset", i32 0}
!415 = !{i32 16, !413, !416}
!416 = !{!"struct_arg_offset", i32 8}
!417 = !{i32 16, !413, !418}
!418 = !{!"struct_arg_offset", i32 16}
!419 = !{i32 16, !420, !414}
!420 = !{!"explicit_arg_num", i32 1}
!421 = !{i32 16, !420, !416}
!422 = !{i32 16, !420, !418}
!423 = !{i32 16, !420, !424}
!424 = !{!"struct_arg_offset", i32 24}
!425 = !{i32 16, !420, !426}
!426 = !{!"struct_arg_offset", i32 32}
!427 = !{i32 16, !420, !428}
!428 = !{!"struct_arg_offset", i32 40}
!429 = !{i32 16, !420, !430}
!430 = !{!"struct_arg_offset", i32 48}
!431 = !{i32 16, !420, !432}
!432 = !{!"struct_arg_offset", i32 56}
!433 = !{i32 16, !420, !434}
!434 = !{!"struct_arg_offset", i32 64}
!435 = !{i32 16, !420, !436}
!436 = !{!"struct_arg_offset", i32 72}
!437 = !{void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i32, i32)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail, !438}
!438 = !{!402, !439}
!439 = !{!"implicit_arg_desc", !404, !405, !407, !408, !409, !410, !411, !440, !442, !443, !444, !446, !447, !448, !449}
!440 = !{i32 16, !441, !414}
!441 = !{!"explicit_arg_num", i32 2}
!442 = !{i32 16, !441, !416}
!443 = !{i32 16, !441, !418}
!444 = !{i32 16, !445, !414}
!445 = !{!"explicit_arg_num", i32 5}
!446 = !{i32 16, !445, !416}
!447 = !{i32 16, !445, !418}
!448 = !{i32 14, !413}
!449 = !{i32 14, !450}
!450 = !{!"explicit_arg_num", i32 3}
!451 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i8, i8, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !452}
!452 = !{!402, !453}
!453 = !{!"implicit_arg_desc", !404, !405, !406, !407, !408, !409, !410, !411, !412, !419, !454, !455, !457, !459, !461, !463, !465, !467}
!454 = !{i32 19, !420, !416}
!455 = !{i32 19, !420, !456}
!456 = !{!"struct_arg_offset", i32 9}
!457 = !{i32 19, !420, !458}
!458 = !{!"struct_arg_offset", i32 10}
!459 = !{i32 19, !420, !460}
!460 = !{!"struct_arg_offset", i32 11}
!461 = !{i32 19, !420, !462}
!462 = !{!"struct_arg_offset", i32 12}
!463 = !{i32 19, !420, !464}
!464 = !{!"struct_arg_offset", i32 13}
!465 = !{i32 19, !420, !466}
!466 = !{!"struct_arg_offset", i32 14}
!467 = !{i32 19, !420, !468}
!468 = !{!"struct_arg_offset", i32 15}
!469 = !{void (i8 addrspace(1)*, i8, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_, !470}
!470 = !{!402, !471}
!471 = !{!"implicit_arg_desc", !404, !405, !407, !408, !409, !410, !448}
!472 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i16, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !473}
!473 = !{!402, !474}
!474 = !{!"implicit_arg_desc", !404, !405, !406, !407, !408, !409, !410, !411, !412, !419, !475, !457, !459, !461, !463, !465, !467}
!475 = !{i32 18, !420, !416}
!476 = !{void (i16 addrspace(1)*, i16, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_, !470}
!477 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i32, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !478}
!478 = !{!402, !479}
!479 = !{!"implicit_arg_desc", !404, !405, !406, !407, !408, !409, !410, !411, !412, !419, !480, !461, !463, !465, !467}
!480 = !{i32 17, !420, !416}
!481 = !{void (i32 addrspace(1)*, i32, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_, !470}
!482 = !{void (i32 addrspace(1)*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i32)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_, !483}
!483 = !{!402, !484}
!484 = !{!"implicit_arg_desc", !404, !405, !485, !408, !409, !410, !411, !448}
!485 = !{i32 5}
!486 = !{i32 2, i32 0}
!487 = !{!"clang version 14.0.5"}
!488 = !{i32 1, !"wchar_size", i32 4}
!489 = !{!490}
!490 = !{i32 44, i32 8}
!491 = !{!492, !492, !493, !493}
!492 = !{i32 4469}
!493 = !{i32 4470}
!494 = !{!495, !495, i64 0}
!495 = !{!"int", !496, i64 0}
!496 = !{!"omnipotent char", !497, i64 0}
!497 = !{!"Simple C/C++ TBAA"}
