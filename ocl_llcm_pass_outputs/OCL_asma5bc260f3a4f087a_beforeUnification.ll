; ------------------------------------------------
; OCL_asma5bc260f3a4f087a_beforeUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
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

; Function Attrs: nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE(%"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %0, %class.__generated_* byval(%class.__generated_) %1) #0 !spirv.ParameterDecorations !319 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %3 = alloca %"class.sycl::_V1::detail::RoundedRangeIDGenerator", align 8, !spirv.Decorations !323
  %4 = alloca %"class.sycl::_V1::range", align 8, !spirv.Decorations !323
  %5 = alloca %"class.sycl::_V1::detail::RoundedRangeKernel", align 8, !spirv.Decorations !323
  %6 = bitcast %"class.sycl::_V1::detail::RoundedRangeKernel"* %5 to i8*
  %7 = bitcast i8* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 104, i8* %7)
  %8 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %5, i64 0, i32 0
  %9 = bitcast %"class.sycl::_V1::range"* %8 to i8*
  %10 = bitcast %"class.sycl::_V1::range"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 8 %10, i64 24, i1 false)
  %11 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %5, i64 0, i32 1
  %12 = bitcast %class._ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_EUlSB_E_* %11 to %class.__generated_*
  %13 = bitcast %class.__generated_* %12 to i8*
  %14 = bitcast %class.__generated_* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 80, i1 false)
  %15 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %16 = extractelement <3 x i64> %15, i32 2
  %17 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %18 = extractelement <3 x i64> %17, i32 1
  %19 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %20 = extractelement <3 x i64> %19, i32 0
  %21 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalSize() #6
  %22 = extractelement <3 x i64> %21, i32 2
  %23 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalSize() #6
  %24 = extractelement <3 x i64> %23, i32 1
  %25 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalSize() #6
  %26 = extractelement <3 x i64> %25, i32 0
  %27 = bitcast %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3 to i8*
  %28 = bitcast i8* %27 to i8*
  call void @llvm.lifetime.start.p0i8(i64 104, i8* %28)
  %29 = bitcast %"class.sycl::_V1::range"* %4 to i8*
  %30 = bitcast i8* %29 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %30)
  %31 = bitcast %"class.sycl::_V1::range"* %4 to i64*
  store i64 %16, i64* %31, align 8
  %32 = bitcast %"class.sycl::_V1::range"* %4 to i64*
  %33 = getelementptr inbounds i64, i64* %32, i64 1
  store i64 %18, i64* %33, align 8
  %34 = bitcast %"class.sycl::_V1::range"* %4 to i64*
  %35 = getelementptr inbounds i64, i64* %34, i64 2
  store i64 %20, i64* %35, align 8
  %36 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 0
  %37 = bitcast %"class.sycl::_V1::range"* %36 to i64*
  store i64 %16, i64* %37, align 8
  %38 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 0, i32 0, i32 0, i64 1
  store i64 %18, i64* %38, align 8
  %39 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 0, i32 0, i32 0, i64 2
  store i64 %20, i64* %39, align 8
  %40 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 1
  %41 = bitcast %"class.sycl::_V1::range"* %40 to i64*
  store i64 %16, i64* %41, align 8
  %42 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 1, i32 0, i32 0, i64 1
  store i64 %18, i64* %42, align 8
  %43 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 %20, i64* %43, align 8
  %44 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 2
  %45 = bitcast %"class.sycl::_V1::range"* %44 to i8*
  %46 = bitcast %"class.sycl::_V1::range"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %45, i8* align 8 %46, i64 24, i1 false)
  %47 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 3
  %48 = bitcast %"class.sycl::_V1::range"* %47 to i64*
  store i64 %22, i64* %48, align 8
  %49 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 3, i32 0, i32 0, i64 1
  store i64 %24, i64* %49, align 8
  %50 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeIDGenerator", %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3, i64 0, i32 3, i32 0, i32 0, i64 2
  store i64 %26, i64* %50, align 8
  br label %51

51:                                               ; preds = %55, %2
  %52 = phi i8 [ 0, %2 ], [ %64, %55 ]
  %53 = phi i32 [ 0, %2 ], [ %65, %55 ]
  %54 = icmp ult i32 %53, 3
  br i1 %54, label %55, label %66

55:                                               ; preds = %51
  %56 = zext i32 %53 to i64
  %57 = bitcast %"class.sycl::_V1::range"* %4 to %"class.sycl::_V1::detail::array"*
  %58 = getelementptr inbounds %"class.sycl::_V1::detail::array", %"class.sycl::_V1::detail::array"* %57, i64 0, i32 0, i64 %56
  %59 = load i64, i64* %58, align 8
  %60 = bitcast %"class.sycl::_V1::range"* %8 to %"class.sycl::_V1::detail::array"*
  %61 = getelementptr inbounds %"class.sycl::_V1::detail::array", %"class.sycl::_V1::detail::array"* %60, i64 0, i32 0, i64 %56
  %62 = load i64, i64* %61, align 8
  %63 = icmp ult i64 %59, %62
  %64 = select i1 %63, i8 %52, i8 1
  %65 = add nuw nsw i32 %53, 1, !spirv.Decorations !324
  br label %51

66:                                               ; preds = %51
  %67 = bitcast %"class.sycl::_V1::range"* %4 to i8*
  %68 = bitcast i8* %67 to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %68)
  %69 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %5, i64 0, i32 1, i32 3
  %70 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %5, i64 0, i32 1, i32 4
  %71 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %5, i64 0, i32 1, i32 5
  %72 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %5, i64 0, i32 1, i32 1
  %73 = getelementptr inbounds %"class.sycl::_V1::detail::RoundedRangeKernel", %"class.sycl::_V1::detail::RoundedRangeKernel"* %5, i64 0, i32 1, i32 2
  %74 = load i8 addrspace(4)*, i8 addrspace(4)** %69, align 8
  %75 = load i64, i64* %70, align 8
  %76 = bitcast %"class.sycl::_V1::range"* %71 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = bitcast %class._ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_EUlSB_E_* %11 to i8 addrspace(4)**
  %79 = load i8 addrspace(4)*, i8 addrspace(4)** %78, align 8
  %80 = load i64, i64* %72, align 8
  %81 = bitcast %"class.sycl::_V1::range"* %73 to i64*
  %82 = load i64, i64* %81, align 8
  br label %83

83:                                               ; preds = %129, %66
  %84 = phi i8 [ %130, %129 ], [ %52, %66 ]
  %85 = icmp eq i8 %84, 0
  br i1 %85, label %86, label %131

86:                                               ; preds = %83
  %87 = bitcast %"class.sycl::_V1::range"* %36 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = load i64, i64* %38, align 8
  %90 = load i64, i64* %39, align 8
  %91 = icmp ult i64 %88, 2147483648
  %i1promo = zext i1 %91 to i8
  %92 = trunc i8 %i1promo to i1
  call void @llvm.assume(i1 %92)
  %93 = icmp ult i64 %89, 2147483648
  %i1promo1 = zext i1 %93 to i8
  %94 = trunc i8 %i1promo1 to i1
  call void @llvm.assume(i1 %94)
  %95 = icmp ult i64 %90, 2147483648
  %i1promo2 = zext i1 %95 to i8
  %96 = trunc i8 %i1promo2 to i1
  call void @llvm.assume(i1 %96)
  %97 = mul i64 %90, %75
  %98 = mul i64 %89, %77
  %99 = getelementptr i8, i8 addrspace(4)* %74, i64 %97
  %100 = getelementptr i8, i8 addrspace(4)* %99, i64 %98
  %101 = getelementptr i8, i8 addrspace(4)* %100, i64 %88
  %102 = load i8, i8 addrspace(4)* %101, align 1
  %103 = mul i64 %90, %80
  %104 = mul i64 %89, %82
  %105 = getelementptr i8, i8 addrspace(4)* %79, i64 %103
  %106 = getelementptr i8, i8 addrspace(4)* %105, i64 %104
  %107 = getelementptr i8, i8 addrspace(4)* %106, i64 %88
  store i8 %102, i8 addrspace(4)* %107, align 1
  br label %108

108:                                              ; preds = %124, %86
  %109 = phi i32 [ 0, %86 ], [ %128, %124 ]
  %110 = icmp ult i32 %109, 3
  br i1 %110, label %111, label %129

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast %"class.sycl::_V1::range"* %47 to %"class.sycl::_V1::detail::array"*
  %114 = getelementptr inbounds %"class.sycl::_V1::detail::array", %"class.sycl::_V1::detail::array"* %113, i64 0, i32 0, i64 %112
  %115 = load i64, i64* %114, align 8
  %116 = bitcast %"class.sycl::_V1::range"* %36 to %"class.sycl::_V1::detail::array"*
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::array", %"class.sycl::_V1::detail::array"* %116, i64 0, i32 0, i64 %112
  %118 = load i64, i64* %117, align 8
  %119 = add i64 %118, %115
  store i64 %119, i64* %117, align 8
  %120 = bitcast %"class.sycl::_V1::range"* %44 to %"class.sycl::_V1::detail::array"*
  %121 = getelementptr inbounds %"class.sycl::_V1::detail::array", %"class.sycl::_V1::detail::array"* %120, i64 0, i32 0, i64 %112
  %122 = load i64, i64* %121, align 8
  %123 = icmp ult i64 %119, %122
  br i1 %123, label %129, label %124

124:                                              ; preds = %111
  %125 = bitcast %"class.sycl::_V1::range"* %40 to %"class.sycl::_V1::detail::array"*
  %126 = getelementptr inbounds %"class.sycl::_V1::detail::array", %"class.sycl::_V1::detail::array"* %125, i64 0, i32 0, i64 %112
  %127 = load i64, i64* %126, align 8
  store i64 %127, i64* %117, align 8
  %128 = add nuw nsw i32 %109, 1, !spirv.Decorations !324
  br label %108

129:                                              ; preds = %111, %108
  %130 = phi i8 [ 1, %108 ], [ 0, %111 ]
  br label %83

131:                                              ; preds = %83
  %132 = bitcast %"class.sycl::_V1::detail::RoundedRangeIDGenerator"* %3 to i8*
  %133 = bitcast i8* %132 to i8*
  call void @llvm.lifetime.end.p0i8(i64 104, i8* %133)
  %134 = bitcast %"class.sycl::_V1::detail::RoundedRangeKernel"* %5 to i8*
  %135 = bitcast i8* %134 to i8*
  call void @llvm.lifetime.end.p0i8(i64 104, i8* %135)
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: alwaysinline nounwind
define spir_func void @__itt_offload_wi_start_wrapper() #1 {
  %1 = alloca [3 x i64], align 8, !spirv.Decorations !323
  %2 = icmp eq i8 0, 0
  br i1 %2, label %26, label %3

3:                                                ; preds = %0
  %4 = bitcast [3 x i64]* %1 to i8*
  %5 = bitcast i8* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %5)
  %6 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 0
  %7 = addrspacecast i64* %6 to i64 addrspace(4)*
  %8 = call spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupId() #6
  %9 = extractelement <3 x i64> %8, i32 0
  store i64 %9, i64* %6, align 8
  %10 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 1
  %11 = extractelement <3 x i64> %8, i32 1
  store i64 %11, i64* %10, align 8
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 2
  %13 = extractelement <3 x i64> %8, i32 2
  store i64 %13, i64* %12, align 8
  %14 = call spir_func i64 @__builtin_spirv_BuiltInGlobalLinearId() #6
  %15 = call spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupSize() #6
  %16 = extractelement <3 x i64> %15, i32 0
  %17 = call spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupSize() #6
  %18 = extractelement <3 x i64> %17, i32 1
  %19 = mul i64 %16, %18
  %20 = call spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupSize() #6
  %21 = extractelement <3 x i64> %20, i32 2
  %22 = mul i64 %19, %21
  %23 = trunc i64 %22 to i32
  call spir_func void @__itt_offload_wi_start_stub(i64 addrspace(4)* %7, i64 %14, i32 %23) #3
  %24 = bitcast [3 x i64]* %1 to i8*
  %25 = bitcast i8* %24 to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %25)
  br label %26

26:                                               ; preds = %3, %0
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline nounwind optnone
define spir_func void @__itt_offload_wi_start_stub(i64 addrspace(4)* %0, i64 %1, i32 %2) #3 {
  %4 = alloca i64 addrspace(4)*, align 8, !spirv.Decorations !323
  %5 = alloca i64, align 8, !spirv.Decorations !323
  %6 = alloca i32, align 4, !spirv.Decorations !327
  %7 = addrspacecast i64 addrspace(4)** %4 to i64 addrspace(4)* addrspace(4)*
  %8 = addrspacecast i64* %5 to i64 addrspace(4)*
  %9 = addrspacecast i32* %6 to i32 addrspace(4)*
  store i64 addrspace(4)* %0, i64 addrspace(4)* addrspace(4)* %7, align 8
  store i64 %1, i64 addrspace(4)* %8, align 8
  store i32 %2, i32 addrspace(4)* %9, align 4
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #5

; Function Attrs: alwaysinline nounwind
define spir_func void @__itt_offload_wi_finish_wrapper() #1 {
  %1 = alloca [3 x i64], align 8, !spirv.Decorations !323
  %2 = icmp eq i8 0, 0
  br i1 %2, label %17, label %3

3:                                                ; preds = %0
  %4 = bitcast [3 x i64]* %1 to i8*
  %5 = bitcast i8* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %5)
  %6 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 0
  %7 = addrspacecast i64* %6 to i64 addrspace(4)*
  %8 = call spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupId() #6
  %9 = extractelement <3 x i64> %8, i32 0
  store i64 %9, i64* %6, align 8
  %10 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 1
  %11 = extractelement <3 x i64> %8, i32 1
  store i64 %11, i64* %10, align 8
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 2
  %13 = extractelement <3 x i64> %8, i32 2
  store i64 %13, i64* %12, align 8
  %14 = call spir_func i64 @__builtin_spirv_BuiltInGlobalLinearId() #6
  call spir_func void @__itt_offload_wi_finish_stub(i64 addrspace(4)* %7, i64 %14) #3
  %15 = bitcast [3 x i64]* %1 to i8*
  %16 = bitcast i8* %15 to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %16)
  br label %17

17:                                               ; preds = %3, %0
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @__itt_offload_wi_finish_stub(i64 addrspace(4)* %0, i64 %1) #3 {
  %3 = alloca i64 addrspace(4)*, align 8, !spirv.Decorations !323
  %4 = alloca i64, align 8, !spirv.Decorations !323
  %5 = addrspacecast i64 addrspace(4)** %3 to i64 addrspace(4)* addrspace(4)*
  %6 = addrspacecast i64* %4 to i64 addrspace(4)*
  store i64 addrspace(4)* %0, i64 addrspace(4)* addrspace(4)* %5, align 8
  store i64 %1, i64 addrspace(4)* %6, align 8
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail(i8 addrspace(1)* %0, i64 %1, %"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %2, i8 addrspace(1)* %3, i64 %4, %"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %5) #0 !spirv.ParameterDecorations !329 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %7 = bitcast %"class.sycl::_V1::range"* %2 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = bitcast %"class.sycl::_V1::range"* %5 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %12 = extractelement <3 x i64> %11, i32 2
  %13 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %14 = extractelement <3 x i64> %13, i32 1
  %15 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %16 = extractelement <3 x i64> %15, i32 0
  %17 = icmp ult i64 %12, 2147483648
  %i1promo = zext i1 %17 to i8
  %18 = trunc i8 %i1promo to i1
  call void @llvm.assume(i1 %18)
  %19 = icmp ult i64 %14, 2147483648
  %i1promo1 = zext i1 %19 to i8
  %20 = trunc i8 %i1promo1 to i1
  call void @llvm.assume(i1 %20)
  %21 = icmp ult i64 %16, 2147483648
  %i1promo2 = zext i1 %21 to i8
  %22 = trunc i8 %i1promo2 to i1
  call void @llvm.assume(i1 %22)
  %23 = mul i64 %16, %4
  %24 = mul i64 %14, %10
  %25 = getelementptr i8, i8 addrspace(1)* %3, i64 %23
  %26 = getelementptr i8, i8 addrspace(1)* %25, i64 %24
  %27 = getelementptr i8, i8 addrspace(1)* %26, i64 %12
  %28 = load i8, i8 addrspace(1)* %27, align 1
  %29 = mul i64 %16, %1
  %30 = mul i64 %14, %8
  %31 = getelementptr i8, i8 addrspace(1)* %0, i64 %29
  %32 = getelementptr i8, i8 addrspace(1)* %31, i64 %30
  %33 = getelementptr i8, i8 addrspace(1)* %32, i64 %12
  store i8 %28, i8 addrspace(1)* %33, align 1
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.2* byval(%class.__generated_.2) %1) #0 !spirv.ParameterDecorations !319 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %3 = bitcast %"class.sycl::_V1::range.0"* %0 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = bitcast %class.__generated_.2* %1 to i8 addrspace(4)**
  %6 = load i8 addrspace(4)*, i8 addrspace(4)** %5, align 8
  %7 = bitcast %class.__generated_.2* %1 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 8
  %9 = load i8, i8* %8, align 8
  %10 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %11 = extractelement <3 x i64> %10, i32 0
  %12 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalSize() #6
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = icmp ult i64 %11, %4
  %i1promo = zext i1 %14 to i8
  br label %15

15:                                               ; preds = %18, %2
  %16 = phi i64 [ %11, %2 ], [ %25, %18 ]
  %17 = phi i8 [ %i1promo, %2 ], [ %24, %18 ]
  %i1trunc = trunc i8 %17 to i1
  br i1 %i1trunc, label %18, label %26

18:                                               ; preds = %15
  %19 = icmp ult i64 %16, 2147483648
  %i1promo1 = zext i1 %19 to i8
  %20 = trunc i8 %i1promo1 to i1
  call void @llvm.assume(i1 %20)
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 %16
  store i8 %9, i8 addrspace(4)* %21, align 1
  %22 = add i64 %16, %13
  %23 = icmp ult i64 %22, %4
  %24 = zext i1 %23 to i8
  %i1trunc3 = trunc i8 %24 to i1
  %25 = select i1 %i1trunc3, i64 %22, i64 %11
  br label %15

26:                                               ; preds = %15
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_(i8 addrspace(1)* %0, i8 zeroext %1) #0 !spirv.ParameterDecorations !332 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %3 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %4 = extractelement <3 x i64> %3, i32 0
  %5 = icmp ult i64 %4, 2147483648
  %i1promo = zext i1 %5 to i8
  %6 = trunc i8 %i1promo to i1
  call void @llvm.assume(i1 %6)
  %7 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %4
  store i8 %1, i8 addrspace(1)* %7, align 1
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.9* byval(%class.__generated_.9) %1) #0 !spirv.ParameterDecorations !319 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %3 = bitcast %"class.sycl::_V1::range.0"* %0 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = bitcast %class.__generated_.9* %1 to i16 addrspace(4)**
  %6 = load i16 addrspace(4)*, i16 addrspace(4)** %5, align 8
  %7 = bitcast %class.__generated_.9* %1 to i16*
  %8 = getelementptr inbounds i16, i16* %7, i64 4
  %9 = load i16, i16* %8, align 8
  %10 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %11 = extractelement <3 x i64> %10, i32 0
  %12 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalSize() #6
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = icmp ult i64 %11, %4
  %i1promo = zext i1 %14 to i8
  br label %15

15:                                               ; preds = %18, %2
  %16 = phi i64 [ %11, %2 ], [ %25, %18 ]
  %17 = phi i8 [ %i1promo, %2 ], [ %24, %18 ]
  %i1trunc = trunc i8 %17 to i1
  br i1 %i1trunc, label %18, label %26

18:                                               ; preds = %15
  %19 = icmp ult i64 %16, 2147483648
  %i1promo1 = zext i1 %19 to i8
  %20 = trunc i8 %i1promo1 to i1
  call void @llvm.assume(i1 %20)
  %21 = getelementptr inbounds i16, i16 addrspace(4)* %6, i64 %16
  store i16 %9, i16 addrspace(4)* %21, align 2
  %22 = add i64 %16, %13
  %23 = icmp ult i64 %22, %4
  %24 = zext i1 %23 to i8
  %i1trunc3 = trunc i8 %24 to i1
  %25 = select i1 %i1trunc3, i64 %22, i64 %11
  br label %15

26:                                               ; preds = %15
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_(i16 addrspace(1)* %0, i16 zeroext %1) #0 !spirv.ParameterDecorations !332 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %3 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %4 = extractelement <3 x i64> %3, i32 0
  %5 = icmp ult i64 %4, 2147483648
  %i1promo = zext i1 %5 to i8
  %6 = trunc i8 %i1promo to i1
  call void @llvm.assume(i1 %6)
  %7 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %4
  store i16 %1, i16 addrspace(1)* %7, align 2
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.12* byval(%class.__generated_.12) %1) #0 !spirv.ParameterDecorations !319 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %3 = bitcast %"class.sycl::_V1::range.0"* %0 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = bitcast %class.__generated_.12* %1 to i32 addrspace(4)**
  %6 = load i32 addrspace(4)*, i32 addrspace(4)** %5, align 8
  %7 = bitcast %class.__generated_.12* %1 to i32*
  %8 = getelementptr inbounds i32, i32* %7, i64 2
  %9 = load i32, i32* %8, align 8
  %10 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %11 = extractelement <3 x i64> %10, i32 0
  %12 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalSize() #6
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = icmp ult i64 %11, %4
  %i1promo = zext i1 %14 to i8
  br label %15

15:                                               ; preds = %18, %2
  %16 = phi i64 [ %11, %2 ], [ %25, %18 ]
  %17 = phi i8 [ %i1promo, %2 ], [ %24, %18 ]
  %i1trunc = trunc i8 %17 to i1
  br i1 %i1trunc, label %18, label %26

18:                                               ; preds = %15
  %19 = icmp ult i64 %16, 2147483648
  %i1promo1 = zext i1 %19 to i8
  %20 = trunc i8 %i1promo1 to i1
  call void @llvm.assume(i1 %20)
  %21 = getelementptr inbounds i32, i32 addrspace(4)* %6, i64 %16
  store i32 %9, i32 addrspace(4)* %21, align 4
  %22 = add i64 %16, %13
  %23 = icmp ult i64 %22, %4
  %24 = zext i1 %23 to i8
  %i1trunc3 = trunc i8 %24 to i1
  %25 = select i1 %i1trunc3, i64 %22, i64 %11
  br label %15

26:                                               ; preds = %15
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_(i32 addrspace(1)* %0, i32 %1) #0 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %3 = call spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6
  %4 = extractelement <3 x i64> %3, i32 0
  %5 = icmp ult i64 %4, 2147483648
  %i1promo = zext i1 %5 to i8
  %6 = trunc i8 %i1promo to i1
  call void @llvm.assume(i1 %6)
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %4
  store i32 %1, i32 addrspace(1)* %7, align 4
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_(i32 addrspace(1)* %0) #0 !spirv.ParameterDecorations !335 {
  call spir_func void @__itt_offload_wi_start_wrapper() #1
  %2 = call spir_func <3 x i64> @__builtin_spirv_BuiltInLocalInvocationId() #6
  %3 = extractelement <3 x i64> %2, i32 0
  %4 = icmp ult i64 %3, 2147483648
  %i1promo = zext i1 %4 to i8
  %5 = trunc i8 %i1promo to i1
  call void @llvm.assume(i1 %5)
  %6 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %3
  %7 = load i32, i32 addrspace(1)* %6, align 4
  call spir_func void @__itt_offload_wg_barrier_wrapper() #1
  %8 = call spir_func i32 @__builtin_spirv_OpGroupIAdd_i32_i32_i32(i32 2, i32 0, i32 %7) #0
  call spir_func void @__itt_offload_wi_resume_wrapper() #1
  store i32 %8, i32 addrspace(1)* %6, align 4
  call spir_func void @__itt_offload_wi_finish_wrapper() #1
  ret void
}

; Function Attrs: alwaysinline nounwind
define spir_func void @__itt_offload_wg_barrier_wrapper() #1 {
  %1 = icmp eq i8 0, 0
  br i1 %1, label %3, label %2

2:                                                ; preds = %0
  call spir_func void @__itt_offload_wg_barrier_stub(i64 0) #3
  br label %3

3:                                                ; preds = %2, %0
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @__itt_offload_wg_barrier_stub(i64 %0) #3 {
  %2 = alloca i64, align 8, !spirv.Decorations !323
  %3 = addrspacecast i64* %2 to i64 addrspace(4)*
  store i64 %0, i64 addrspace(4)* %3, align 8
  ret void
}

; Function Attrs: nounwind
declare spir_func i32 @__builtin_spirv_OpGroupIAdd_i32_i32_i32(i32, i32, i32) #0

; Function Attrs: alwaysinline nounwind
define spir_func void @__itt_offload_wi_resume_wrapper() #1 {
  %1 = alloca [3 x i64], align 8, !spirv.Decorations !323
  %2 = icmp eq i8 0, 0
  br i1 %2, label %17, label %3

3:                                                ; preds = %0
  %4 = bitcast [3 x i64]* %1 to i8*
  %5 = bitcast i8* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %5)
  %6 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 0
  %7 = addrspacecast i64* %6 to i64 addrspace(4)*
  %8 = call spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupId() #6
  %9 = extractelement <3 x i64> %8, i32 0
  store i64 %9, i64* %6, align 8
  %10 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 1
  %11 = extractelement <3 x i64> %8, i32 1
  store i64 %11, i64* %10, align 8
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %1, i64 0, i64 2
  %13 = extractelement <3 x i64> %8, i32 2
  store i64 %13, i64* %12, align 8
  %14 = call spir_func i64 @__builtin_spirv_BuiltInGlobalLinearId() #6
  call spir_func void @__itt_offload_wi_resume_stub(i64 addrspace(4)* %7, i64 %14) #3
  %15 = bitcast [3 x i64]* %1 to i8*
  %16 = bitcast i8* %15 to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %16)
  br label %17

17:                                               ; preds = %3, %0
  ret void
}

; Function Attrs: noinline nounwind optnone
define spir_func void @__itt_offload_wi_resume_stub(i64 addrspace(4)* %0, i64 %1) #3 {
  %3 = alloca i64 addrspace(4)*, align 8, !spirv.Decorations !323
  %4 = alloca i64, align 8, !spirv.Decorations !323
  %5 = addrspacecast i64 addrspace(4)** %3 to i64 addrspace(4)* addrspace(4)*
  %6 = addrspacecast i64* %4 to i64 addrspace(4)*
  store i64 addrspace(4)* %0, i64 addrspace(4)* addrspace(4)* %5, align 8
  store i64 %1, i64 addrspace(4)* %6, align 8
  ret void
}

; Function Attrs: nounwind readnone
declare spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalSize() #6

; Function Attrs: nounwind readnone
declare spir_func <3 x i64> @__builtin_spirv_BuiltInGlobalInvocationId() #6

; Function Attrs: nounwind readnone
declare spir_func <3 x i64> @__builtin_spirv_BuiltInLocalInvocationId() #6

; Function Attrs: nounwind readnone
declare spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupId() #6

; Function Attrs: nounwind readnone
declare spir_func i64 @__builtin_spirv_BuiltInGlobalLinearId() #6

; Function Attrs: nounwind readnone
declare spir_func <3 x i64> @__builtin_spirv_BuiltInWorkgroupSize() #6

attributes #0 = { nounwind }
attributes #1 = { alwaysinline nounwind }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { noinline nounwind optnone }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #6 = { nounwind readnone }

!opencl.kernels = !{!0, !6, !12, !15, !19, !22, !25, !28, !31}
!IGCMetadata = !{!37}
!opencl.enable.FP_CONTRACT = !{}
!opencl.spir.version = !{!315}
!opencl.ocl.version = !{!315}
!opencl.used.extensions = !{!316}
!opencl.used.optional.core.features = !{!317}
!opencl.compiler.options = !{!318}
!igc.functions = !{}

!0 = !{void (%"class.sycl::_V1::range"*, %class.__generated_*)* @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 0, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"class.sycl::_V1::range", !"class.__generated_"}
!4 = !{!"kernel_arg_type_qual", !"", !""}
!5 = !{!"kernel_arg_base_type", !"class.sycl::_V1::range", !"class.__generated_"}
!6 = !{void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail, !7, !8, !9, !10, !11}
!7 = !{!"kernel_arg_addr_space", i32 1, i32 0, i32 0, i32 1, i32 0, i32 0}
!8 = !{!"kernel_arg_access_qual", !"none", !"none", !"none", !"none", !"none", !"none"}
!9 = !{!"kernel_arg_type", !"char*", !"long", !"class.sycl::_V1::range", !"char*", !"long", !"class.sycl::_V1::range"}
!10 = !{!"kernel_arg_type_qual", !"", !"", !"", !"", !"", !""}
!11 = !{!"kernel_arg_base_type", !"char*", !"long", !"class.sycl::_V1::range", !"char*", !"long", !"class.sycl::_V1::range"}
!12 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !1, !2, !13, !4, !14}
!13 = !{!"kernel_arg_type", !"class.sycl::_V1::range.0", !"class.__generated_.2"}
!14 = !{!"kernel_arg_base_type", !"class.sycl::_V1::range.0", !"class.__generated_.2"}
!15 = !{void (i8 addrspace(1)*, i8)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_, !16, !2, !17, !4, !18}
!16 = !{!"kernel_arg_addr_space", i32 1, i32 0}
!17 = !{!"kernel_arg_type", !"char*", !"uchar"}
!18 = !{!"kernel_arg_base_type", !"char*", !"uchar"}
!19 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !1, !2, !20, !4, !21}
!20 = !{!"kernel_arg_type", !"class.sycl::_V1::range.0", !"class.__generated_.9"}
!21 = !{!"kernel_arg_base_type", !"class.sycl::_V1::range.0", !"class.__generated_.9"}
!22 = !{void (i16 addrspace(1)*, i16)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_, !16, !2, !23, !4, !24}
!23 = !{!"kernel_arg_type", !"short*", !"ushort"}
!24 = !{!"kernel_arg_base_type", !"short*", !"ushort"}
!25 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !1, !2, !26, !4, !27}
!26 = !{!"kernel_arg_type", !"class.sycl::_V1::range.0", !"class.__generated_.12"}
!27 = !{!"kernel_arg_base_type", !"class.sycl::_V1::range.0", !"class.__generated_.12"}
!28 = !{void (i32 addrspace(1)*, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_, !16, !2, !29, !4, !30}
!29 = !{!"kernel_arg_type", !"int*", !"int"}
!30 = !{!"kernel_arg_base_type", !"int*", !"int"}
!31 = !{void (i32 addrspace(1)*)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_, !32, !33, !34, !35, !36}
!32 = !{!"kernel_arg_addr_space", i32 1}
!33 = !{!"kernel_arg_access_qual", !"none"}
!34 = !{!"kernel_arg_type", !"int*"}
!35 = !{!"kernel_arg_type_qual", !""}
!36 = !{!"kernel_arg_base_type", !"int*"}
!37 = !{!"ModuleMD", !38, !39, !107, !183, !213, !229, !246, !256, !258, !259, !272, !273, !274, !275, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !294, !298, !299, !300, !301, !302, !303, !304, !305, !152, !306, !307, !308, !310, !313, !314}
!38 = !{!"isPrecise", i1 false}
!39 = !{!"compOpt", !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106}
!40 = !{!"DenormsAreZero", i1 false}
!41 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!42 = !{!"OptDisable", i1 false}
!43 = !{!"MadEnable", i1 false}
!44 = !{!"NoSignedZeros", i1 false}
!45 = !{!"NoNaNs", i1 false}
!46 = !{!"FloatRoundingMode", i32 0}
!47 = !{!"FloatCvtIntRoundingMode", i32 3}
!48 = !{!"LoadCacheDefault", i32 -1}
!49 = !{!"StoreCacheDefault", i32 -1}
!50 = !{!"VISAPreSchedRPThreshold", i32 0}
!51 = !{!"SetLoopUnrollThreshold", i32 0}
!52 = !{!"UnsafeMathOptimizations", i1 false}
!53 = !{!"disableCustomUnsafeOpts", i1 false}
!54 = !{!"disableReducePow", i1 false}
!55 = !{!"FiniteMathOnly", i1 false}
!56 = !{!"FastRelaxedMath", i1 false}
!57 = !{!"DashGSpecified", i1 false}
!58 = !{!"FastCompilation", i1 false}
!59 = !{!"UseScratchSpacePrivateMemory", i1 true}
!60 = !{!"RelaxedBuiltins", i1 false}
!61 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!62 = !{!"GreaterThan2GBBufferRequired", i1 true}
!63 = !{!"GreaterThan4GBBufferRequired", i1 true}
!64 = !{!"DisableA64WA", i1 false}
!65 = !{!"ForceEnableA64WA", i1 false}
!66 = !{!"PushConstantsEnable", i1 true}
!67 = !{!"HasPositivePointerOffset", i1 false}
!68 = !{!"HasBufferOffsetArg", i1 false}
!69 = !{!"BufferOffsetArgOptional", i1 true}
!70 = !{!"replaceGlobalOffsetsByZero", i1 false}
!71 = !{!"forcePixelShaderSIMDMode", i32 0}
!72 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!73 = !{!"UniformWGS", i1 false}
!74 = !{!"disableVertexComponentPacking", i1 false}
!75 = !{!"disablePartialVertexComponentPacking", i1 false}
!76 = !{!"PreferBindlessImages", i1 false}
!77 = !{!"UseBindlessMode", i1 false}
!78 = !{!"UseLegacyBindlessMode", i1 true}
!79 = !{!"disableMathRefactoring", i1 false}
!80 = !{!"atomicBranch", i1 false}
!81 = !{!"ForceInt32DivRemEmu", i1 false}
!82 = !{!"ForceInt32DivRemEmuSP", i1 false}
!83 = !{!"DisableFastestSingleCSSIMD", i1 false}
!84 = !{!"DisableFastestLinearScan", i1 false}
!85 = !{!"UseStatelessforPrivateMemory", i1 false}
!86 = !{!"EnableTakeGlobalAddress", i1 false}
!87 = !{!"IsLibraryCompilation", i1 false}
!88 = !{!"FastVISACompile", i1 false}
!89 = !{!"MatchSinCosPi", i1 false}
!90 = !{!"ExcludeIRFromZEBinary", i1 false}
!91 = !{!"EmitZeBinVISASections", i1 false}
!92 = !{!"FP64GenEmulationEnabled", i1 false}
!93 = !{!"allowDisableRematforCS", i1 false}
!94 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!95 = !{!"DisableCPSOmaskWA", i1 false}
!96 = !{!"DisableFastestGopt", i1 false}
!97 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!98 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!99 = !{!"DisableConstantCoalescing", i1 false}
!100 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!101 = !{!"WaEnableALTModeVisaWA", i1 false}
!102 = !{!"NewSpillCostFunction", i1 false}
!103 = !{!"ForceLargeGRFNum4RQ", i1 false}
!104 = !{!"DisableEUFusion", i1 false}
!105 = !{!"DisableFDivToFMulInvOpt", i1 false}
!106 = !{!"initializePhiSampleSourceWA", i1 false}
!107 = !{!"FuncMD", !108, !109, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182}
!108 = !{!"FuncMDMap[0]", void (%"class.sycl::_V1::range"*, %class.__generated_*)* @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE}
!109 = !{!"FuncMDValue[0]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!110 = !{!"localOffsets"}
!111 = !{!"workGroupWalkOrder", !112, !113, !114}
!112 = !{!"dim0", i32 0}
!113 = !{!"dim1", i32 0}
!114 = !{!"dim2", i32 0}
!115 = !{!"funcArgs"}
!116 = !{!"functionType", !"KernelFunction"}
!117 = !{!"rtInfo", !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !137}
!118 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!119 = !{!"isContinuation", i1 false}
!120 = !{!"hasTraceRayPayload", i1 false}
!121 = !{!"hasHitAttributes", i1 false}
!122 = !{!"hasCallableData", i1 false}
!123 = !{!"ShaderStackSize", i32 0}
!124 = !{!"ShaderHash", i64 0}
!125 = !{!"ShaderName", !""}
!126 = !{!"ParentName", !""}
!127 = !{!"SlotNum", i1* null}
!128 = !{!"NOSSize", i32 0}
!129 = !{!"globalRootSignatureSize", i32 0}
!130 = !{!"Entries"}
!131 = !{!"SpillUnions"}
!132 = !{!"CustomHitAttrSizeInBytes", i32 0}
!133 = !{!"Types", !134, !135, !136}
!134 = !{!"FrameStartTys"}
!135 = !{!"ArgumentTys"}
!136 = !{!"FullFrameTys"}
!137 = !{!"Aliases"}
!138 = !{!"resAllocMD", !139, !140, !141, !142, !143}
!139 = !{!"uavsNumType", i32 0}
!140 = !{!"srvsNumType", i32 0}
!141 = !{!"samplersNumType", i32 0}
!142 = !{!"argAllocMDList"}
!143 = !{!"inlineSamplersMD"}
!144 = !{!"maxByteOffsets"}
!145 = !{!"IsInitializer", i1 false}
!146 = !{!"IsFinalizer", i1 false}
!147 = !{!"CompiledSubGroupsNumber", i32 0}
!148 = !{!"hasInlineVmeSamplers", i1 false}
!149 = !{!"localSize", i32 0}
!150 = !{!"localIDPresent", i1 false}
!151 = !{!"groupIDPresent", i1 false}
!152 = !{!"privateMemoryPerWI", i32 0}
!153 = !{!"globalIDPresent", i1 false}
!154 = !{!"hasSyncRTCalls", i1 false}
!155 = !{!"hasNonKernelArgLoad", i1 false}
!156 = !{!"hasNonKernelArgStore", i1 false}
!157 = !{!"hasNonKernelArgAtomic", i1 false}
!158 = !{!"UserAnnotations"}
!159 = !{!"m_OpenCLArgAddressSpaces"}
!160 = !{!"m_OpenCLArgAccessQualifiers"}
!161 = !{!"m_OpenCLArgTypes"}
!162 = !{!"m_OpenCLArgBaseTypes"}
!163 = !{!"m_OpenCLArgTypeQualifiers"}
!164 = !{!"m_OpenCLArgNames"}
!165 = !{!"m_OpenCLArgScalarAsPointers"}
!166 = !{!"m_OptsToDisablePerFunc"}
!167 = !{!"FuncMDMap[1]", void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail}
!168 = !{!"FuncMDValue[1]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!169 = !{!"FuncMDMap[2]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!170 = !{!"FuncMDValue[2]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!171 = !{!"FuncMDMap[3]", void (i8 addrspace(1)*, i8)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!172 = !{!"FuncMDValue[3]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!173 = !{!"FuncMDMap[4]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!174 = !{!"FuncMDValue[4]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!175 = !{!"FuncMDMap[5]", void (i16 addrspace(1)*, i16)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!176 = !{!"FuncMDValue[5]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!177 = !{!"FuncMDMap[6]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!178 = !{!"FuncMDValue[6]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!179 = !{!"FuncMDMap[7]", void (i32 addrspace(1)*, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!180 = !{!"FuncMDValue[7]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!181 = !{!"FuncMDMap[8]", void (i32 addrspace(1)*)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_}
!182 = !{!"FuncMDValue[8]", !110, !111, !115, !116, !117, !138, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!183 = !{!"pushInfo", !184, !185, !186, !189, !190, !191, !192, !193, !194, !195, !196, !209, !210, !211, !212}
!184 = !{!"pushableAddresses"}
!185 = !{!"bindlessPushInfo"}
!186 = !{!"dynamicBufferInfo", !187, !188}
!187 = !{!"firstIndex", i32 0}
!188 = !{!"numOffsets", i32 0}
!189 = !{!"MaxNumberOfPushedBuffers", i32 0}
!190 = !{!"inlineConstantBufferSlot", i32 -1}
!191 = !{!"inlineConstantBufferOffset", i32 -1}
!192 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!193 = !{!"constants"}
!194 = !{!"inputs"}
!195 = !{!"constantReg"}
!196 = !{!"simplePushInfoArr", !197, !206, !207, !208}
!197 = !{!"simplePushInfoArrVec[0]", !198, !199, !200, !201, !202, !203, !204, !205}
!198 = !{!"cbIdx", i32 0}
!199 = !{!"pushableAddressGrfOffset", i32 -1}
!200 = !{!"pushableOffsetGrfOffset", i32 -1}
!201 = !{!"offset", i32 0}
!202 = !{!"size", i32 0}
!203 = !{!"isStateless", i1 false}
!204 = !{!"isBindless", i1 false}
!205 = !{!"simplePushLoads"}
!206 = !{!"simplePushInfoArrVec[1]", !198, !199, !200, !201, !202, !203, !204, !205}
!207 = !{!"simplePushInfoArrVec[2]", !198, !199, !200, !201, !202, !203, !204, !205}
!208 = !{!"simplePushInfoArrVec[3]", !198, !199, !200, !201, !202, !203, !204, !205}
!209 = !{!"simplePushBufferUsed", i32 0}
!210 = !{!"pushAnalysisWIInfos"}
!211 = !{!"inlineRTGlobalPtrOffset", i32 0}
!212 = !{!"rtSyncSurfPtrOffset", i32 0}
!213 = !{!"psInfo", !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228}
!214 = !{!"BlendStateDisabledMask", i8 0}
!215 = !{!"SkipSrc0Alpha", i1 false}
!216 = !{!"DualSourceBlendingDisabled", i1 false}
!217 = !{!"ForceEnableSimd32", i1 false}
!218 = !{!"outputDepth", i1 false}
!219 = !{!"outputStencil", i1 false}
!220 = !{!"outputMask", i1 false}
!221 = !{!"blendToFillEnabled", i1 false}
!222 = !{!"forceEarlyZ", i1 false}
!223 = !{!"hasVersionedLoop", i1 false}
!224 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!225 = !{!"NumSamples", i8 0}
!226 = !{!"blendOptimizationMode"}
!227 = !{!"colorOutputMask"}
!228 = !{!"WaDisableVRS", i1 false}
!229 = !{!"csInfo", !230, !231, !232, !233, !234, !50, !51, !235, !236, !237, !238, !239, !240, !241, !242, !80, !243, !244, !245}
!230 = !{!"maxWorkGroupSize", i32 0}
!231 = !{!"waveSize", i32 0}
!232 = !{!"ComputeShaderSecondCompile"}
!233 = !{!"forcedSIMDSize", i8 0}
!234 = !{!"forceTotalGRFNum", i32 0}
!235 = !{!"allowLowerSimd", i1 false}
!236 = !{!"disableSimd32Slicing", i1 false}
!237 = !{!"disableSplitOnSpill", i1 false}
!238 = !{!"forcedVISAPreRAScheduler", i1 false}
!239 = !{!"disableLocalIdOrderOptimizations", i1 false}
!240 = !{!"disableDispatchAlongY", i1 false}
!241 = !{!"neededThreadIdLayout", i1* null}
!242 = !{!"forceTileYWalk", i1 false}
!243 = !{!"walkOrderEnabled", i1 false}
!244 = !{!"walkOrderOverride", i32 0}
!245 = !{!"ResForHfPacking"}
!246 = !{!"msInfo", !247, !248, !249, !250, !251, !252, !253, !254, !255}
!247 = !{!"PrimitiveTopology", i32 3}
!248 = !{!"MaxNumOfPrimitives", i32 0}
!249 = !{!"MaxNumOfVertices", i32 0}
!250 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!251 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!252 = !{!"WorkGroupSize", i32 0}
!253 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!254 = !{!"IndexFormat", i32 6}
!255 = !{!"SubgroupSize", i32 0}
!256 = !{!"taskInfo", !257, !252, !253, !255}
!257 = !{!"MaxNumOfOutputs", i32 0}
!258 = !{!"NBarrierCnt", i32 0}
!259 = !{!"rtInfo", !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271}
!260 = !{!"RayQueryAllocSizeInBytes", i32 0}
!261 = !{!"NumContinuations", i32 0}
!262 = !{!"RTAsyncStackAddrspace", i32 -1}
!263 = !{!"RTAsyncStackSurfaceStateOffset", i1* null}
!264 = !{!"SWHotZoneAddrspace", i32 -1}
!265 = !{!"SWHotZoneSurfaceStateOffset", i1* null}
!266 = !{!"SWStackAddrspace", i32 -1}
!267 = !{!"SWStackSurfaceStateOffset", i1* null}
!268 = !{!"RTSyncStackAddrspace", i32 -1}
!269 = !{!"RTSyncStackSurfaceStateOffset", i1* null}
!270 = !{!"doSyncDispatchRays", i1 false}
!271 = !{!"MemStyle", !"Xe"}
!272 = !{!"CurUniqueIndirectIdx", i32 0}
!273 = !{!"inlineDynTextures"}
!274 = !{!"inlineResInfoData"}
!275 = !{!"immConstant", !276, !277, !278}
!276 = !{!"data"}
!277 = !{!"sizes"}
!278 = !{!"zeroIdxs"}
!279 = !{!"stringConstants"}
!280 = !{!"inlineConstantBuffers"}
!281 = !{!"inlineGlobalBuffers"}
!282 = !{!"GlobalPointerProgramBinaryInfos"}
!283 = !{!"ConstantPointerProgramBinaryInfos"}
!284 = !{!"GlobalBufferAddressRelocInfo"}
!285 = !{!"ConstantBufferAddressRelocInfo"}
!286 = !{!"forceLscCacheList"}
!287 = !{!"SrvMap"}
!288 = !{!"RasterizerOrderedByteAddressBuffer"}
!289 = !{!"RasterizerOrderedViews"}
!290 = !{!"MinNOSPushConstantSize", i32 0}
!291 = !{!"inlineProgramScopeOffsets"}
!292 = !{!"shaderData", !293}
!293 = !{!"numReplicas", i32 0}
!294 = !{!"URBInfo", !295, !296, !297}
!295 = !{!"has64BVertexHeaderInput", i1 false}
!296 = !{!"has64BVertexHeaderOutput", i1 false}
!297 = !{!"hasVertexHeader", i1 true}
!298 = !{!"UseBindlessImage", i1 false}
!299 = !{!"enableRangeReduce", i1 false}
!300 = !{!"allowMatchMadOptimizationforVS", i1 false}
!301 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!302 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!303 = !{!"statefulResourcesNotAliased", i1 false}
!304 = !{!"disableMixMode", i1 false}
!305 = !{!"genericAccessesResolved", i1 false}
!306 = !{!"PrivateMemoryPerFG"}
!307 = !{!"m_OptsToDisable"}
!308 = !{!"capabilities", !309}
!309 = !{!"globalVariableDecorationsINTEL", i1 false}
!310 = !{!"m_ShaderResourceViewMcsMask", !311, !312}
!311 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!312 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!313 = !{!"computedDepthMode", i32 0}
!314 = !{!"isHDCFastClearShader", i1 false}
!315 = !{i32 1, i32 0}
!316 = !{!"cl_khr_subgroups"}
!317 = !{}
!318 = !{!"-ze-opt-level=1", !"-ze-opt-level=O1"}
!319 = !{!320, !320}
!320 = !{!321, !322}
!321 = !{i32 38, i32 2}
!322 = !{i32 44, i32 8}
!323 = !{!322}
!324 = !{!325, !325, !326, !326}
!325 = !{i32 4469}
!326 = !{i32 4470}
!327 = !{!328}
!328 = !{i32 44, i32 4}
!329 = !{!330, !317, !320, !330, !317, !320}
!330 = !{!331}
!331 = !{i32 44, i32 1}
!332 = !{!317, !333}
!333 = !{!334}
!334 = !{i32 38, i32 0}
!335 = !{!327}
