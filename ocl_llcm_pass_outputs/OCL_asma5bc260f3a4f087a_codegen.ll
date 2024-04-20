; ------------------------------------------------
; OCL_asma5bc260f3a4f087a_codegen.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::range" = type { %"class.sycl::_V1::detail::array" }
%"class.sycl::_V1::detail::array" = type { [3 x i64] }
%class.__generated_ = type { i8 addrspace(1)*, i64, %"class.sycl::_V1::range", i8 addrspace(1)*, i64, %"class.sycl::_V1::range" }
%"class.sycl::_V1::range.0" = type { %"class.sycl::_V1::detail::array.1" }
%"class.sycl::_V1::detail::array.1" = type { [1 x i64] }
%class.__generated_.2 = type <{ i8 addrspace(1)*, i8, [7 x i8] }>
%class.__generated_.9 = type <{ i8 addrspace(1)*, i16, [6 x i8] }>
%class.__generated_.12 = type <{ i8 addrspace(1)*, i32, [4 x i8] }>

@GenSLM.LocalMemPoolOnGetMemPoolPtr = addrspace(3) global [4096 x i8] zeroinitializer, section "localSLM", align 4

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE(%"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %0, %class.__generated_* byval(%class.__generated_) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i64 %const_reg_qword2, i64 %const_reg_qword3, i64 %const_reg_qword4, i64 %const_reg_qword5, i64 %const_reg_qword6, i64 %const_reg_qword7, i64 %const_reg_qword8, i64 %const_reg_qword9, i64 %const_reg_qword10, i64 %const_reg_qword11, i64 %const_reg_qword12) #0 {
  %3 = bitcast i64 %const_reg_qword to <2 x i32>
  %4 = extractelement <2 x i32> %3, i32 0
  %5 = extractelement <2 x i32> %3, i32 1
  %6 = bitcast i64 %const_reg_qword1 to <2 x i32>
  %7 = extractelement <2 x i32> %6, i32 0
  %8 = extractelement <2 x i32> %6, i32 1
  %9 = bitcast i64 %const_reg_qword2 to <2 x i32>
  %10 = extractelement <2 x i32> %9, i32 0
  %11 = extractelement <2 x i32> %9, i32 1
  %12 = extractelement <8 x i32> %payloadHeader, i32 0
  %13 = extractelement <8 x i32> %payloadHeader, i32 1
  %14 = extractelement <8 x i32> %payloadHeader, i32 2
  %15 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %16 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %17 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %18 = extractelement <8 x i32> %r0, i32 1
  %19 = extractelement <8 x i32> %r0, i32 6
  %20 = extractelement <8 x i32> %r0, i32 7
  %mul.i15.i.i = mul i32 %17, %20
  %localIdZ27 = zext i16 %localIdZ to i32
  %add.i17.i.i = add i32 %mul.i15.i.i, %localIdZ27
  %add4.i19.i.i = add i32 %add.i17.i.i, %14
  %mul.i7.i.i15 = mul i32 %16, %19
  %localIdY41 = zext i16 %localIdY to i32
  %add.i9.i.i18 = add i32 %mul.i7.i.i15, %localIdY41
  %add4.i11.i.i20 = add i32 %add.i9.i.i18, %13
  %mul.i.i.i35 = mul i32 %15, %18
  %localIdX55 = zext i16 %localIdX to i32
  %add.i.i.i38 = add i32 %mul.i.i.i35, %localIdX55
  %add4.i.i.i40 = add i32 %add.i.i.i38, %12
  %21 = icmp eq i32 0, %5
  %22 = icmp ult i32 %add4.i19.i.i, %4
  %23 = and i1 %21, %22
  %24 = icmp ult i32 0, %5
  %25 = or i1 %23, %24
  %26 = icmp eq i32 0, %8
  %27 = icmp ult i32 %add4.i11.i.i20, %7
  %28 = and i1 %26, %27
  %29 = icmp ult i32 0, %8
  %30 = or i1 %28, %29
  %31 = icmp eq i32 0, %11
  %32 = icmp ult i32 %add4.i.i.i40, %10
  %33 = and i1 %31, %32
  %34 = icmp ult i32 0, %11
  %35 = or i1 %33, %34
  %36 = and i1 %35, %30
  %37 = and i1 %36, %25
  br i1 %37, label %.lr.ph.preheader, label %.._crit_edge99_crit_edge

.._crit_edge99_crit_edge:                         ; preds = %2
  br label %._crit_edge99

.lr.ph.preheader:                                 ; preds = %2
  %38 = bitcast i64 %const_reg_qword4 to <2 x i32>
  %39 = extractelement <2 x i32> %38, i32 0
  %40 = extractelement <2 x i32> %38, i32 1
  %41 = bitcast i64 %const_reg_qword5 to <2 x i32>
  %42 = extractelement <2 x i32> %41, i32 0
  %43 = extractelement <2 x i32> %41, i32 1
  %44 = bitcast i64 %const_reg_qword9 to <2 x i32>
  %45 = extractelement <2 x i32> %44, i32 0
  %46 = extractelement <2 x i32> %44, i32 1
  %47 = bitcast i64 %const_reg_qword10 to <2 x i32>
  %48 = extractelement <2 x i32> %47, i32 0
  %49 = extractelement <2 x i32> %47, i32 1
  %50 = extractelement <3 x i32> %globalSize, i32 0
  %51 = extractelement <3 x i32> %globalSize, i32 1
  %52 = extractelement <3 x i32> %globalSize, i32 2
  %conv.i = zext i32 %50 to i64
  %conv2.i76 = zext i32 %51 to i64
  %conv5.i70 = zext i32 %52 to i64
  %conv.i.i.i41 = zext i32 %add4.i.i.i40 to i64
  %conv.i12.i.i21 = zext i32 %add4.i11.i.i20 to i64
  %conv.i20.i.i = zext i32 %add4.i19.i.i to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %53 = phi i64 [ %126, %._crit_edge ], [ %conv.i.i.i41, %.lr.ph.preheader ]
  %54 = phi i64 [ %127, %._crit_edge ], [ %conv.i12.i.i21, %.lr.ph.preheader ]
  %55 = phi i64 [ %128, %._crit_edge ], [ %conv.i20.i.i, %.lr.ph.preheader ]
  %56 = bitcast i64 %54 to <2 x i32>
  %57 = extractelement <2 x i32> %56, i32 0
  %58 = extractelement <2 x i32> %56, i32 1
  %59 = bitcast i64 %53 to <2 x i32>
  %60 = extractelement <2 x i32> %59, i32 0
  %61 = extractelement <2 x i32> %59, i32 1
  %62 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %60, i32 %61, i32 %45, i32 %46)
  %63 = extractvalue { i32, i32 } %62, 0
  %64 = extractvalue { i32, i32 } %62, 1
  %65 = insertelement <2 x i32> undef, i32 %63, i32 0
  %66 = insertelement <2 x i32> %65, i32 %64, i32 1
  %67 = bitcast <2 x i32> %66 to i64
  %68 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %57, i32 %58, i32 %48, i32 %49)
  %69 = extractvalue { i32, i32 } %68, 0
  %70 = extractvalue { i32, i32 } %68, 1
  %71 = insertelement <2 x i32> undef, i32 %69, i32 0
  %72 = insertelement <2 x i32> %71, i32 %70, i32 1
  %73 = bitcast <2 x i32> %72 to i64
  %74 = add i64 %67, %const_reg_qword8
  %75 = add i64 %74, %73
  %76 = add i64 %75, %55
  %77 = inttoptr i64 %76 to i8 addrspace(4)*
  %78 = addrspacecast i8 addrspace(4)* %77 to i8 addrspace(1)*
  %79 = load i8, i8 addrspace(1)* %78, align 1
  %80 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %60, i32 %61, i32 %39, i32 %40)
  %81 = extractvalue { i32, i32 } %80, 0
  %82 = extractvalue { i32, i32 } %80, 1
  %83 = insertelement <2 x i32> undef, i32 %81, i32 0
  %84 = insertelement <2 x i32> %83, i32 %82, i32 1
  %85 = bitcast <2 x i32> %84 to i64
  %86 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %57, i32 %58, i32 %42, i32 %43)
  %87 = extractvalue { i32, i32 } %86, 0
  %88 = extractvalue { i32, i32 } %86, 1
  %89 = insertelement <2 x i32> undef, i32 %87, i32 0
  %90 = insertelement <2 x i32> %89, i32 %88, i32 1
  %91 = bitcast <2 x i32> %90 to i64
  %92 = add i64 %85, %const_reg_qword3
  %93 = add i64 %92, %91
  %94 = add i64 %93, %55
  %95 = inttoptr i64 %94 to i8 addrspace(4)*
  %96 = addrspacecast i8 addrspace(4)* %95 to i8 addrspace(1)*
  store i8 %79, i8 addrspace(1)* %96, align 1
  %97 = add nuw nsw i64 %55, %conv5.i70
  %98 = bitcast i64 %97 to <2 x i32>
  %99 = extractelement <2 x i32> %98, i32 0
  %100 = extractelement <2 x i32> %98, i32 1
  %101 = icmp eq i32 %100, %5
  %102 = icmp ult i32 %99, %4
  %103 = and i1 %101, %102
  %104 = icmp ult i32 %100, %5
  %105 = or i1 %103, %104
  br i1 %105, label %.lr.ph.._crit_edge_crit_edge, label %106

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

106:                                              ; preds = %.lr.ph
  %107 = add nuw nsw i64 %54, %conv2.i76
  %108 = bitcast i64 %107 to <2 x i32>
  %109 = extractelement <2 x i32> %108, i32 0
  %110 = extractelement <2 x i32> %108, i32 1
  %111 = icmp eq i32 %110, %8
  %112 = icmp ult i32 %109, %7
  %113 = and i1 %111, %112
  %114 = icmp ult i32 %110, %8
  %115 = or i1 %113, %114
  br i1 %115, label %.._crit_edge_crit_edge, label %116

.._crit_edge_crit_edge:                           ; preds = %106
  br label %._crit_edge

116:                                              ; preds = %106
  %117 = add nuw nsw i64 %53, %conv.i
  %118 = bitcast i64 %117 to <2 x i32>
  %119 = extractelement <2 x i32> %118, i32 0
  %120 = extractelement <2 x i32> %118, i32 1
  %121 = icmp eq i32 %120, %11
  %122 = icmp ult i32 %119, %10
  %123 = and i1 %121, %122
  %124 = icmp ult i32 %120, %11
  %125 = or i1 %123, %124
  br i1 %125, label %.._crit_edge_crit_edge141, label %._crit_edge99.loopexit

._crit_edge99.loopexit:                           ; preds = %116
  br label %._crit_edge99

.._crit_edge_crit_edge141:                        ; preds = %116
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge141, %.._crit_edge_crit_edge, %.lr.ph.._crit_edge_crit_edge
  %126 = phi i64 [ %53, %.lr.ph.._crit_edge_crit_edge ], [ %53, %.._crit_edge_crit_edge ], [ %117, %.._crit_edge_crit_edge141 ]
  %127 = phi i64 [ %54, %.lr.ph.._crit_edge_crit_edge ], [ %107, %.._crit_edge_crit_edge ], [ %conv.i12.i.i21, %.._crit_edge_crit_edge141 ]
  %128 = phi i64 [ %97, %.lr.ph.._crit_edge_crit_edge ], [ %conv.i20.i.i, %.._crit_edge_crit_edge ], [ %conv.i20.i.i, %.._crit_edge_crit_edge141 ]
  br label %.lr.ph

._crit_edge99:                                    ; preds = %.._crit_edge99_crit_edge, %._crit_edge99.loopexit
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

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail(i8 addrspace(1)* %0, i64 %1, %"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %2, i8 addrspace(1)* %3, i64 %4, %"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %5, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i64 %const_reg_qword2, i64 %const_reg_qword3, i64 %const_reg_qword4, i64 %const_reg_qword5, i32 %bufferOffset, i32 %bufferOffset6) #0 {
  %7 = bitcast i64 %1 to <2 x i32>
  %8 = extractelement <2 x i32> %7, i32 0
  %9 = extractelement <2 x i32> %7, i32 1
  %10 = bitcast i64 %4 to <2 x i32>
  %11 = extractelement <2 x i32> %10, i32 0
  %12 = extractelement <2 x i32> %10, i32 1
  %13 = bitcast i64 %const_reg_qword to <2 x i32>
  %14 = extractelement <2 x i32> %13, i32 0
  %15 = extractelement <2 x i32> %13, i32 1
  %16 = bitcast i64 %const_reg_qword3 to <2 x i32>
  %17 = extractelement <2 x i32> %16, i32 0
  %18 = extractelement <2 x i32> %16, i32 1
  %19 = extractelement <8 x i32> %payloadHeader, i32 0
  %20 = extractelement <8 x i32> %payloadHeader, i32 1
  %21 = extractelement <8 x i32> %payloadHeader, i32 2
  %22 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %23 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %24 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %25 = extractelement <8 x i32> %r0, i32 1
  %26 = extractelement <8 x i32> %r0, i32 6
  %27 = extractelement <8 x i32> %r0, i32 7
  %mul.i15.i.i25 = mul i32 %24, %27
  %localIdZ21 = zext i16 %localIdZ to i32
  %add.i17.i.i28 = add i32 %mul.i15.i.i25, %localIdZ21
  %add4.i19.i.i30 = add i32 %add.i17.i.i28, %21
  %mul.i7.i.i45 = mul i32 %23, %26
  %localIdY35 = zext i16 %localIdY to i32
  %add.i9.i.i48 = add i32 %mul.i7.i.i45, %localIdY35
  %add4.i11.i.i50 = add i32 %add.i9.i.i48, %20
  %mul.i.i.i = mul i32 %22, %25
  %localIdX49 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX49
  %add4.i.i.i = add i32 %add.i.i.i, %19
  %28 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %add4.i.i.i, i32 0, i32 %11, i32 %12)
  %29 = extractvalue { i32, i32 } %28, 0
  %30 = extractvalue { i32, i32 } %28, 1
  %31 = insertelement <2 x i32> undef, i32 %29, i32 0
  %32 = insertelement <2 x i32> %31, i32 %30, i32 1
  %33 = bitcast <2 x i32> %32 to i64
  %34 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %add4.i11.i.i50, i32 0, i32 %17, i32 %18)
  %35 = extractvalue { i32, i32 } %34, 0
  %36 = extractvalue { i32, i32 } %34, 1
  %37 = insertelement <2 x i32> undef, i32 %35, i32 0
  %38 = insertelement <2 x i32> %37, i32 %36, i32 1
  %39 = bitcast <2 x i32> %38 to i64
  %40 = ptrtoint i8 addrspace(1)* %3 to i64
  %41 = add i64 %33, %40
  %42 = add i64 %41, %39
  %conv.i20.i.i31 = zext i32 %add4.i19.i.i30 to i64
  %43 = add i64 %42, %conv.i20.i.i31
  %44 = inttoptr i64 %43 to i8 addrspace(1)*
  %45 = load i8, i8 addrspace(1)* %44, align 1
  %46 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %add4.i.i.i, i32 0, i32 %8, i32 %9)
  %47 = extractvalue { i32, i32 } %46, 0
  %48 = extractvalue { i32, i32 } %46, 1
  %49 = insertelement <2 x i32> undef, i32 %47, i32 0
  %50 = insertelement <2 x i32> %49, i32 %48, i32 1
  %51 = bitcast <2 x i32> %50 to i64
  %52 = call { i32, i32 } @llvm.genx.GenISA.mul.pair(i32 %add4.i11.i.i50, i32 0, i32 %14, i32 %15)
  %53 = extractvalue { i32, i32 } %52, 0
  %54 = extractvalue { i32, i32 } %52, 1
  %55 = insertelement <2 x i32> undef, i32 %53, i32 0
  %56 = insertelement <2 x i32> %55, i32 %54, i32 1
  %57 = bitcast <2 x i32> %56 to i64
  %58 = ptrtoint i8 addrspace(1)* %0 to i64
  %59 = add i64 %51, %58
  %60 = add i64 %59, %57
  %61 = add i64 %60, %conv.i20.i.i31
  %62 = inttoptr i64 %61 to i8 addrspace(1)*
  store i8 %45, i8 addrspace(1)* %62, align 1
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.2* byval(%class.__generated_.2) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4, i8 %const_reg_byte5, i8 %const_reg_byte6, i8 %const_reg_byte7, i8 %const_reg_byte8) #0 {
  %3 = bitcast i64 %const_reg_qword to <2 x i32>
  %4 = extractelement <2 x i32> %3, i32 0
  %5 = extractelement <2 x i32> %3, i32 1
  %6 = extractelement <8 x i32> %payloadHeader, i32 0
  %7 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %8 = extractelement <8 x i32> %r0, i32 1
  %mul.i.i.i = mul i32 %7, %8
  %localIdX10 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX10
  %add4.i.i.i = add i32 %add.i.i.i, %6
  %9 = icmp eq i32 0, %5
  %10 = icmp ult i32 %add4.i.i.i, %4
  %11 = and i1 %9, %10
  %12 = icmp ult i32 0, %5
  %13 = or i1 %11, %12
  br i1 %13, label %.lr.ph.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %14 = extractelement <3 x i32> %globalSize, i32 0
  %conv.i = zext i32 %14 to i64
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
  %15 = phi i64 [ %32, %.lr.ph..lr.ph_crit_edge ], [ %conv.i.i.i, %.lr.ph.preheader ]
  %16 = add i64 %15, %const_reg_qword1
  %17 = inttoptr i64 %16 to i8 addrspace(4)*
  %18 = addrspacecast i8 addrspace(4)* %17 to i8 addrspace(1)*
  store i8 %const_reg_byte, i8 addrspace(1)* %18, align 1
  %19 = add nuw nsw i64 %15, %conv.i
  %20 = bitcast i64 %19 to <2 x i32>
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = icmp eq i32 %22, %5
  %24 = icmp ult i32 %21, %4
  %25 = and i1 %23, %24
  %26 = icmp ult i32 %22, %5
  %27 = or i1 %25, %26
  br i1 %27, label %.lr.ph..lr.ph_crit_edge, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %28 = select i1 %27, i32 %21, i32 %add4.i.i.i
  %29 = select i1 %27, i32 %22, i32 0
  %30 = insertelement <2 x i32> undef, i32 %28, i32 0
  %31 = insertelement <2 x i32> %30, i32 %29, i32 1
  %32 = bitcast <2 x i32> %31 to i64
  br label %.lr.ph

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_(i8 addrspace(1)* %0, i8 zeroext %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i32 0
  %4 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %5 = extractelement <8 x i32> %r0, i32 1
  %mul.i.i.i = mul i32 %4, %5
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %6 = ptrtoint i8 addrspace(1)* %0 to i64
  %7 = add i64 %6, %conv.i.i.i
  %8 = inttoptr i64 %7 to i8 addrspace(1)*
  store i8 %1, i8 addrspace(1)* %8, align 1
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.9* byval(%class.__generated_.9) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i16 %const_reg_word, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4, i8 %const_reg_byte5, i8 %const_reg_byte6) #0 {
  %3 = bitcast i64 %const_reg_qword to <2 x i32>
  %4 = extractelement <2 x i32> %3, i32 0
  %5 = extractelement <2 x i32> %3, i32 1
  %6 = extractelement <8 x i32> %payloadHeader, i32 0
  %7 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %8 = extractelement <8 x i32> %r0, i32 1
  %mul.i.i.i = mul i32 %7, %8
  %localIdX8 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX8
  %add4.i.i.i = add i32 %add.i.i.i, %6
  %9 = icmp eq i32 0, %5
  %10 = icmp ult i32 %add4.i.i.i, %4
  %11 = and i1 %9, %10
  %12 = icmp ult i32 0, %5
  %13 = or i1 %11, %12
  br i1 %13, label %.lr.ph.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %14 = extractelement <3 x i32> %globalSize, i32 0
  %conv.i = zext i32 %14 to i64
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
  %15 = phi i64 [ %33, %.lr.ph..lr.ph_crit_edge ], [ %conv.i.i.i, %.lr.ph.preheader ]
  %16 = shl i64 %15, 1
  %17 = add i64 %16, %const_reg_qword1
  %18 = inttoptr i64 %17 to i16 addrspace(4)*
  %19 = addrspacecast i16 addrspace(4)* %18 to i16 addrspace(1)*
  store i16 %const_reg_word, i16 addrspace(1)* %19, align 2
  %20 = add nuw nsw i64 %15, %conv.i
  %21 = bitcast i64 %20 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i32 0
  %23 = extractelement <2 x i32> %21, i32 1
  %24 = icmp eq i32 %23, %5
  %25 = icmp ult i32 %22, %4
  %26 = and i1 %24, %25
  %27 = icmp ult i32 %23, %5
  %28 = or i1 %26, %27
  br i1 %28, label %.lr.ph..lr.ph_crit_edge, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %29 = select i1 %28, i32 %22, i32 %add4.i.i.i
  %30 = select i1 %28, i32 %23, i32 0
  %31 = insertelement <2 x i32> undef, i32 %29, i32 0
  %32 = insertelement <2 x i32> %31, i32 %30, i32 1
  %33 = bitcast <2 x i32> %32 to i64
  br label %.lr.ph

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_(i16 addrspace(1)* %0, i16 zeroext %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i32 0
  %4 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %5 = extractelement <8 x i32> %r0, i32 1
  %mul.i.i.i = mul i32 %4, %5
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %6 = ptrtoint i16 addrspace(1)* %0 to i64
  %7 = shl nuw nsw i64 %conv.i.i.i, 1
  %8 = add i64 %7, %6
  %9 = inttoptr i64 %8 to i16 addrspace(1)*
  store i16 %1, i16 addrspace(1)* %9, align 2
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.12* byval(%class.__generated_.12) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i32 %const_reg_dword, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4) #0 {
  %3 = bitcast i64 %const_reg_qword to <2 x i32>
  %4 = extractelement <2 x i32> %3, i32 0
  %5 = extractelement <2 x i32> %3, i32 1
  %6 = extractelement <8 x i32> %payloadHeader, i32 0
  %7 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %8 = extractelement <8 x i32> %r0, i32 1
  %mul.i.i.i = mul i32 %7, %8
  %localIdX6 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX6
  %add4.i.i.i = add i32 %add.i.i.i, %6
  %9 = icmp eq i32 0, %5
  %10 = icmp ult i32 %add4.i.i.i, %4
  %11 = and i1 %9, %10
  %12 = icmp ult i32 0, %5
  %13 = or i1 %11, %12
  br i1 %13, label %.lr.ph.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %14 = extractelement <3 x i32> %globalSize, i32 0
  %conv.i = zext i32 %14 to i64
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
  %15 = phi i64 [ %33, %.lr.ph..lr.ph_crit_edge ], [ %conv.i.i.i, %.lr.ph.preheader ]
  %16 = shl i64 %15, 2
  %17 = add i64 %16, %const_reg_qword1
  %18 = inttoptr i64 %17 to i32 addrspace(4)*
  %19 = addrspacecast i32 addrspace(4)* %18 to i32 addrspace(1)*
  store i32 %const_reg_dword, i32 addrspace(1)* %19, align 4
  %20 = add nuw nsw i64 %15, %conv.i
  %21 = bitcast i64 %20 to <2 x i32>
  %22 = extractelement <2 x i32> %21, i32 0
  %23 = extractelement <2 x i32> %21, i32 1
  %24 = icmp eq i32 %23, %5
  %25 = icmp ult i32 %22, %4
  %26 = and i1 %24, %25
  %27 = icmp ult i32 %23, %5
  %28 = or i1 %26, %27
  br i1 %28, label %.lr.ph..lr.ph_crit_edge, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %29 = select i1 %28, i32 %22, i32 %add4.i.i.i
  %30 = select i1 %28, i32 %23, i32 0
  %31 = insertelement <2 x i32> undef, i32 %29, i32 0
  %32 = insertelement <2 x i32> %31, i32 %30, i32 1
  %33 = bitcast <2 x i32> %32 to i64
  br label %.lr.ph

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_(i32 addrspace(1)* %0, i32 %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i32 0
  %4 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %5 = extractelement <8 x i32> %r0, i32 1
  %mul.i.i.i = mul i32 %4, %5
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %6 = ptrtoint i32 addrspace(1)* %0 to i64
  %7 = shl nuw nsw i64 %conv.i.i.i, 2
  %8 = add i64 %7, %6
  %9 = inttoptr i64 %8 to i32 addrspace(1)*
  store i32 %1, i32 addrspace(1)* %9, align 4
  ret void
}

; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_(i32 addrspace(1)* %0, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i32 %bufferOffset) #0 {
  %2 = extractelement <3 x i32> %localSize, i32 0
  %3 = extractelement <3 x i32> %localSize, i32 1
  %4 = extractelement <3 x i32> %localSize, i32 2
  %5 = ptrtoint i32 addrspace(1)* %0 to i64
  %conv.i.i = zext i16 %localIdX to i64
  %6 = shl nuw nsw i64 %conv.i.i, 2
  %7 = add i64 %6, %5
  %8 = inttoptr i64 %7 to i32 addrspace(1)*
  %9 = load i32, i32 addrspace(1)* %8, align 4
  %10 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %9, i8 0, i32 0)
  %11 = bitcast <8 x i32> %r0 to <32 x i8>
  %12 = extractelement <32 x i8> %11, i32 8
  %localThreadId4 = zext i8 %12 to i32
  %mul.i.i.i.i = mul i32 %3, %2
  %mul3.i.i.i.i = mul i32 %mul.i.i.i.i, %4
  %simdSize = call i32 @llvm.genx.GenISA.simdSize()
  %add.i1.i.i = add nsw i32 %simdSize, -1
  %sub.i.i.i = add i32 %add.i1.i.i, %mul3.i.i.i.i
  %13 = lshr i32 %simdSize, 4
  %14 = lshr i32 %sub.i.i.i, 3
  %15 = lshr i32 %14, %13
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %and.i.i.i = and i32 %add.i1.i.i, %mul3.i.i.i.i
  %cmp.i.i.i = icmp eq i32 %and.i.i.i, 0
  br i1 %cmp.i.i.i, label %.cond.true.i.i.i_crit_edge, label %lor.rhs.i.i.i

.cond.true.i.i.i_crit_edge:                       ; preds = %1
  br label %cond.true.i.i.i

lor.rhs.i.i.i:                                    ; preds = %1
  %16 = add i32 %mul3.i.i.i.i, %simdSize
  %sub.i.i.i.i = add i32 %16, -1
  %17 = lshr i32 %sub.i.i.i.i, 3
  %18 = lshr i32 %17, %13
  %sub4.i.i.i = add nsw i32 %18, -1
  %cmp5.i.i.i = icmp ugt i32 %sub4.i.i.i, %localThreadId4
  br i1 %cmp5.i.i.i, label %lor.rhs.i.i.i.cond.true.i.i.i_crit_edge, label %lor.rhs.i.i.i.__builtin_spirv_BuiltInSubgroupSize.exit.i.i_crit_edge

lor.rhs.i.i.i.__builtin_spirv_BuiltInSubgroupSize.exit.i.i_crit_edge: ; preds = %lor.rhs.i.i.i
  br label %__builtin_spirv_BuiltInSubgroupSize.exit.i.i

lor.rhs.i.i.i.cond.true.i.i.i_crit_edge:          ; preds = %lor.rhs.i.i.i
  br label %cond.true.i.i.i

cond.true.i.i.i:                                  ; preds = %lor.rhs.i.i.i.cond.true.i.i.i_crit_edge, %.cond.true.i.i.i_crit_edge
  br label %__builtin_spirv_BuiltInSubgroupSize.exit.i.i

__builtin_spirv_BuiltInSubgroupSize.exit.i.i:     ; preds = %lor.rhs.i.i.i.__builtin_spirv_BuiltInSubgroupSize.exit.i.i_crit_edge, %cond.true.i.i.i
  %cond.i.i.i = phi i32 [ %simdSize, %cond.true.i.i.i ], [ %and.i.i.i, %lor.rhs.i.i.i.__builtin_spirv_BuiltInSubgroupSize.exit.i.i_crit_edge ]
  %cmp.i.i = icmp eq i16 %simdLaneId16, 0
  br i1 %cmp.i.i, label %if.then.i.i, label %__builtin_spirv_BuiltInSubgroupSize.exit.i.i.if.end.i.i_crit_edge

__builtin_spirv_BuiltInSubgroupSize.exit.i.i.if.end.i.i_crit_edge: ; preds = %__builtin_spirv_BuiltInSubgroupSize.exit.i.i
  br label %if.end.i.i

if.then.i.i:                                      ; preds = %__builtin_spirv_BuiltInSubgroupSize.exit.i.i
  %19 = shl nuw nsw i32 %localThreadId4, 2
  %20 = inttoptr i32 %19 to i32 addrspace(3)*
  store i32 %10, i32 addrspace(3)* %20, align 4, !tbaa !510
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %__builtin_spirv_BuiltInSubgroupSize.exit.i.i.if.end.i.i_crit_edge, %if.then.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %cmp797.i.i = icmp ugt i32 %15, %simdSize
  br i1 %cmp797.i.i, label %while.body.lr.ph.i.i, label %if.end.i.i.while.end.i.i_crit_edge

if.end.i.i.while.end.i.i_crit_edge:               ; preds = %if.end.i.i
  br label %while.end.i.i

while.body.lr.ph.i.i:                             ; preds = %if.end.i.i
  %mul.i.i = mul nuw nsw i32 %simdSize, %localThreadId4
  %add.i1.i = add nuw nsw i32 %mul.i.i, %simdLaneId
  %21 = shl i32 %add.i1.i, 2
  %22 = inttoptr i32 %21 to i32 addrspace(3)*
  %23 = shl nuw nsw i32 %localThreadId4, 2
  %24 = inttoptr i32 %23 to i32 addrspace(3)*
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %if.end21.i.i.while.body.i.i_crit_edge, %while.body.lr.ph.i.i
  %values_num.098.i.i = phi i32 [ %15, %while.body.lr.ph.i.i ], [ %26, %if.end21.i.i.while.body.i.i_crit_edge ]
  %sub.i.i = add nsw i32 %add.i1.i.i, %values_num.098.i.i
  %25 = lshr i32 %sub.i.i, 3
  %26 = lshr i32 %25, %13
  %mul9.i.i = mul i32 %26, %simdSize
  %cmp10.i.i = icmp ult i32 %add.i1.i, %values_num.098.i.i
  br i1 %cmp10.i.i, label %cond.true.i.i, label %while.body.i.i.cond.end.i.i_crit_edge

while.body.i.i.cond.end.i.i_crit_edge:            ; preds = %while.body.i.i
  br label %cond.end.i.i

cond.true.i.i:                                    ; preds = %while.body.i.i
  %27 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !510
  br label %cond.end.i.i

cond.end.i.i:                                     ; preds = %while.body.i.i.cond.end.i.i_crit_edge, %cond.true.i.i
  %cond.i.i = phi i32 [ %27, %cond.true.i.i ], [ 0, %while.body.i.i.cond.end.i.i_crit_edge ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %cmp13.i.i = icmp ult i32 %add.i1.i, %mul9.i.i
  br i1 %cmp13.i.i, label %if.then14.i.i, label %cond.end.i.i.if.end21.i.i_crit_edge

cond.end.i.i.if.end21.i.i_crit_edge:              ; preds = %cond.end.i.i
  br label %if.end21.i.i

if.then14.i.i:                                    ; preds = %cond.end.i.i
  %28 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %cond.i.i, i8 0, i32 0)
  br i1 %cmp.i.i, label %if.then17.i.i, label %if.then14.i.i.if.end21.i.i_crit_edge

if.then14.i.i.if.end21.i.i_crit_edge:             ; preds = %if.then14.i.i
  br label %if.end21.i.i

if.then17.i.i:                                    ; preds = %if.then14.i.i
  store i32 %28, i32 addrspace(3)* %24, align 4, !tbaa !510
  br label %if.end21.i.i

if.end21.i.i:                                     ; preds = %if.then14.i.i.if.end21.i.i_crit_edge, %cond.end.i.i.if.end21.i.i_crit_edge, %if.then17.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %cmp7.i.i = icmp ugt i32 %26, %simdSize
  br i1 %cmp7.i.i, label %if.end21.i.i.while.body.i.i_crit_edge, label %while.end.i.i.loopexit

while.end.i.i.loopexit:                           ; preds = %if.end21.i.i
  %.lcssa = phi i32 [ %26, %if.end21.i.i ]
  br label %while.end.i.i

if.end21.i.i.while.body.i.i_crit_edge:            ; preds = %if.end21.i.i
  br label %while.body.i.i

while.end.i.i:                                    ; preds = %if.end.i.i.while.end.i.i_crit_edge, %while.end.i.i.loopexit
  %values_num.0.lcssa.i.i = phi i32 [ %15, %if.end.i.i.while.end.i.i_crit_edge ], [ %.lcssa, %while.end.i.i.loopexit ]
  %cmp23.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, %cond.i.i.i
  br i1 %cmp23.i.i, label %if.then24.i.i, label %if.else.i.i

if.else.i.i:                                      ; preds = %while.end.i.i
  %cmp31.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, %simdLaneId
  br i1 %cmp31.i.i, label %cond.true32.i.i, label %if.else.i.i.cond.end36.i.i_crit_edge

if.else.i.i.cond.end36.i.i_crit_edge:             ; preds = %if.else.i.i
  br label %cond.end36.i.i

cond.true32.i.i:                                  ; preds = %if.else.i.i
  %29 = shl nuw nsw i32 %simdLaneId, 2
  %30 = inttoptr i32 %29 to i32 addrspace(3)*
  %31 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !510
  br label %cond.end36.i.i

cond.end36.i.i:                                   ; preds = %if.else.i.i.cond.end36.i.i_crit_edge, %cond.true32.i.i
  %cond37.i.i = phi i32 [ %31, %cond.true32.i.i ], [ 0, %if.else.i.i.cond.end36.i.i_crit_edge ]
  %32 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %cond37.i.i, i8 0, i32 0)
  br label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

if.then24.i.i:                                    ; preds = %while.end.i.i
  %33 = load i32, i32 addrspace(3)* null, align 4294967296, !tbaa !510
  %cmp2699.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, 1
  br i1 %cmp2699.i.i, label %for.body.i.i.preheader, label %if.then24.i.i.__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit_crit_edge

if.then24.i.i.__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit_crit_edge: ; preds = %if.then24.i.i
  br label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

for.body.i.i.preheader:                           ; preds = %if.then24.i.i
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.for.body.i.i_crit_edge, %for.body.i.i.preheader
  %s.0101.i.i = phi i32 [ %inc.i.i, %for.body.i.i.for.body.i.i_crit_edge ], [ 1, %for.body.i.i.preheader ]
  %sg_aggregate.0100.i.i = phi i32 [ %add.i.i.i, %for.body.i.i.for.body.i.i_crit_edge ], [ %33, %for.body.i.i.preheader ]
  %34 = shl i32 %s.0101.i.i, 2
  %35 = inttoptr i32 %34 to i32 addrspace(3)*
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !510
  %add.i.i.i = add nsw i32 %36, %sg_aggregate.0100.i.i
  %inc.i.i = add nuw nsw i32 %s.0101.i.i, 1
  %cmp26.i.i = icmp ult i32 %inc.i.i, %values_num.0.lcssa.i.i
  br i1 %cmp26.i.i, label %for.body.i.i.for.body.i.i_crit_edge, label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit.loopexit

__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit.loopexit: ; preds = %for.body.i.i
  %add.i.i.i.lcssa = phi i32 [ %add.i.i.i, %for.body.i.i ]
  br label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

for.body.i.i.for.body.i.i_crit_edge:              ; preds = %for.body.i.i
  br label %for.body.i.i

__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit:     ; preds = %if.then24.i.i.__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit_crit_edge, %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit.loopexit, %cond.end36.i.i
  %result.0.i.i = phi i32 [ %32, %cond.end36.i.i ], [ %33, %if.then24.i.i.__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit_crit_edge ], [ %add.i.i.i.lcssa, %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit.loopexit ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  store i32 %result.0.i.i, i32 addrspace(1)* %8, align 4
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

; Function Desc: 
; Output: 
; Output: 
; Arg 0: 
; Arg 1: 
; Arg 2: 
; Arg 3: 
; Function Attrs: nounwind readnone
declare { i32, i32 } @llvm.genx.GenISA.mul.pair(i32, i32, i32, i32) #7

attributes #0 = { convergent nounwind null_pointer_is_valid "less-precise-fpmad"="true" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #4 = { convergent "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { convergent inaccessiblememonly nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { convergent nounwind }

!IGCMetadata = !{!0}
!igc.functions = !{!421, !458, !472, !490, !493, !497, !498, !502, !503}
!opencl.ocl.version = !{!507, !507, !507, !507, !507}
!opencl.spir.version = !{!507, !507, !507, !507, !507}
!llvm.ident = !{!508, !508, !508, !508, !508}
!llvm.module.flags = !{!509}
!printf.strings = !{}

!0 = !{!"ModuleMD", !1, !2, !70, !271, !301, !317, !334, !344, !346, !347, !360, !361, !362, !363, !367, !368, !369, !370, !371, !372, !373, !374, !375, !376, !377, !378, !379, !380, !382, !386, !387, !388, !389, !390, !391, !392, !393, !141, !394, !413, !414, !416, !419, !420}
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
!70 = !{!"FuncMD", !71, !72, !171, !172, !206, !207, !218, !219, !227, !228, !235, !236, !243, !244, !251, !252, !259, !260}
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
!167 = !{!"m_OptsToDisablePerFunc", !168, !169, !170}
!168 = !{!"m_OptsToDisablePerFuncSet[0]", !"IGC-AddressArithmeticSinking"}
!169 = !{!"m_OptsToDisablePerFuncSet[1]", !"IGC-AllowSimd32Slicing"}
!170 = !{!"m_OptsToDisablePerFuncSet[2]", !"IGC-SinkLoadOpt"}
!171 = !{!"FuncMDMap[1]", void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i32, i32)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail}
!172 = !{!"FuncMDValue[1]", !73, !74, !78, !79, !80, !173, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !175, !181, !186, !193, !200, !163, !205, !167}
!173 = !{!"resAllocMD", !102, !103, !104, !174, !132}
!174 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129}
!175 = !{!"m_OpenCLArgAddressSpaces", !176, !150, !177, !178, !179, !180}
!176 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 1}
!177 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 0}
!178 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 1}
!179 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 0}
!180 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 0}
!181 = !{!"m_OpenCLArgAccessQualifiers", !152, !153, !182, !183, !184, !185}
!182 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!183 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!184 = !{!"m_OpenCLArgAccessQualifiersVec[4]", !"none"}
!185 = !{!"m_OpenCLArgAccessQualifiersVec[5]", !"none"}
!186 = !{!"m_OpenCLArgTypes", !187, !188, !189, !190, !191, !192}
!187 = !{!"m_OpenCLArgTypesVec[0]", !"char*"}
!188 = !{!"m_OpenCLArgTypesVec[1]", !"long"}
!189 = !{!"m_OpenCLArgTypesVec[2]", !"class.sycl::_V1::range"}
!190 = !{!"m_OpenCLArgTypesVec[3]", !"char*"}
!191 = !{!"m_OpenCLArgTypesVec[4]", !"long"}
!192 = !{!"m_OpenCLArgTypesVec[5]", !"class.sycl::_V1::range"}
!193 = !{!"m_OpenCLArgBaseTypes", !194, !195, !196, !197, !198, !199}
!194 = !{!"m_OpenCLArgBaseTypesVec[0]", !"char*"}
!195 = !{!"m_OpenCLArgBaseTypesVec[1]", !"long"}
!196 = !{!"m_OpenCLArgBaseTypesVec[2]", !"class.sycl::_V1::range"}
!197 = !{!"m_OpenCLArgBaseTypesVec[3]", !"char*"}
!198 = !{!"m_OpenCLArgBaseTypesVec[4]", !"long"}
!199 = !{!"m_OpenCLArgBaseTypesVec[5]", !"class.sycl::_V1::range"}
!200 = !{!"m_OpenCLArgTypeQualifiers", !161, !162, !201, !202, !203, !204}
!201 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!202 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!203 = !{!"m_OpenCLArgTypeQualifiersVec[4]", !""}
!204 = !{!"m_OpenCLArgTypeQualifiersVec[5]", !""}
!205 = !{!"m_OpenCLArgScalarAsPointers"}
!206 = !{!"FuncMDMap[2]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i8, i8, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!207 = !{!"FuncMDValue[2]", !73, !74, !78, !79, !80, !208, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !210, !213, !160, !163, !216, !167}
!208 = !{!"resAllocMD", !102, !103, !104, !209, !132}
!209 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128}
!210 = !{!"m_OpenCLArgTypes", !211, !212}
!211 = !{!"m_OpenCLArgTypesVec[0]", !"class.sycl::_V1::range.0"}
!212 = !{!"m_OpenCLArgTypesVec[1]", !"class.__generated_.2"}
!213 = !{!"m_OpenCLArgBaseTypes", !214, !215}
!214 = !{!"m_OpenCLArgBaseTypesVec[0]", !"class.sycl::_V1::range.0"}
!215 = !{!"m_OpenCLArgBaseTypesVec[1]", !"class.__generated_.2"}
!216 = !{!"m_OpenCLArgScalarAsPointers", !217}
!217 = !{!"m_OpenCLArgScalarAsPointersSet[0]", i32 11}
!218 = !{!"FuncMDMap[3]", void (i8 addrspace(1)*, i8, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!219 = !{!"FuncMDValue[3]", !73, !74, !78, !79, !80, !220, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !222, !151, !223, !225, !160, !163, !205, !167}
!220 = !{!"resAllocMD", !102, !103, !104, !221, !132}
!221 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117}
!222 = !{!"m_OpenCLArgAddressSpaces", !176, !150}
!223 = !{!"m_OpenCLArgTypes", !187, !224}
!224 = !{!"m_OpenCLArgTypesVec[1]", !"uchar"}
!225 = !{!"m_OpenCLArgBaseTypes", !194, !226}
!226 = !{!"m_OpenCLArgBaseTypesVec[1]", !"uchar"}
!227 = !{!"FuncMDMap[4]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i16, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!228 = !{!"FuncMDValue[4]", !73, !74, !78, !79, !80, !229, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !231, !233, !160, !163, !216, !167}
!229 = !{!"resAllocMD", !102, !103, !104, !230, !132}
!230 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127}
!231 = !{!"m_OpenCLArgTypes", !211, !232}
!232 = !{!"m_OpenCLArgTypesVec[1]", !"class.__generated_.9"}
!233 = !{!"m_OpenCLArgBaseTypes", !214, !234}
!234 = !{!"m_OpenCLArgBaseTypesVec[1]", !"class.__generated_.9"}
!235 = !{!"FuncMDMap[5]", void (i16 addrspace(1)*, i16, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!236 = !{!"FuncMDValue[5]", !73, !74, !78, !79, !80, !220, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !222, !151, !237, !240, !160, !163, !205, !167}
!237 = !{!"m_OpenCLArgTypes", !238, !239}
!238 = !{!"m_OpenCLArgTypesVec[0]", !"short*"}
!239 = !{!"m_OpenCLArgTypesVec[1]", !"ushort"}
!240 = !{!"m_OpenCLArgBaseTypes", !241, !242}
!241 = !{!"m_OpenCLArgBaseTypesVec[0]", !"short*"}
!242 = !{!"m_OpenCLArgBaseTypesVec[1]", !"ushort"}
!243 = !{!"FuncMDMap[6]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i32, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!244 = !{!"FuncMDValue[6]", !73, !74, !78, !79, !80, !245, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !247, !249, !160, !163, !216, !167}
!245 = !{!"resAllocMD", !102, !103, !104, !246, !132}
!246 = !{!"argAllocMDList", !106, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125}
!247 = !{!"m_OpenCLArgTypes", !211, !248}
!248 = !{!"m_OpenCLArgTypesVec[1]", !"class.__generated_.12"}
!249 = !{!"m_OpenCLArgBaseTypes", !214, !250}
!250 = !{!"m_OpenCLArgBaseTypesVec[1]", !"class.__generated_.12"}
!251 = !{!"FuncMDMap[7]", void (i32 addrspace(1)*, i32, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!252 = !{!"FuncMDValue[7]", !73, !74, !78, !79, !80, !220, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !222, !151, !253, !256, !160, !163, !205, !167}
!253 = !{!"m_OpenCLArgTypes", !254, !255}
!254 = !{!"m_OpenCLArgTypesVec[0]", !"int*"}
!255 = !{!"m_OpenCLArgTypesVec[1]", !"int"}
!256 = !{!"m_OpenCLArgBaseTypes", !257, !258}
!257 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int*"}
!258 = !{!"m_OpenCLArgBaseTypesVec[1]", !"int"}
!259 = !{!"FuncMDMap[8]", void (i32 addrspace(1)*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i32)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_}
!260 = !{!"FuncMDValue[8]", !261, !74, !78, !79, !80, !220, !133, !134, !135, !136, !137, !265, !139, !140, !141, !142, !143, !144, !145, !146, !147, !266, !267, !268, !269, !270, !163, !205, !167}
!261 = !{!"localOffsets", !262}
!262 = !{!"localOffsetsVec[0]", !263, !264}
!263 = !{!"m_Offset", i32 0}
!264 = !{!"m_Var", [4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr}
!265 = !{!"localSize", i32 4096}
!266 = !{!"m_OpenCLArgAddressSpaces", !176}
!267 = !{!"m_OpenCLArgAccessQualifiers", !152}
!268 = !{!"m_OpenCLArgTypes", !254}
!269 = !{!"m_OpenCLArgBaseTypes", !257}
!270 = !{!"m_OpenCLArgTypeQualifiers", !161}
!271 = !{!"pushInfo", !272, !273, !274, !277, !278, !279, !280, !281, !282, !283, !284, !297, !298, !299, !300}
!272 = !{!"pushableAddresses"}
!273 = !{!"bindlessPushInfo"}
!274 = !{!"dynamicBufferInfo", !275, !276}
!275 = !{!"firstIndex", i32 0}
!276 = !{!"numOffsets", i32 0}
!277 = !{!"MaxNumberOfPushedBuffers", i32 0}
!278 = !{!"inlineConstantBufferSlot", i32 -1}
!279 = !{!"inlineConstantBufferOffset", i32 -1}
!280 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!281 = !{!"constants"}
!282 = !{!"inputs"}
!283 = !{!"constantReg"}
!284 = !{!"simplePushInfoArr", !285, !294, !295, !296}
!285 = !{!"simplePushInfoArrVec[0]", !286, !287, !288, !289, !290, !291, !292, !293}
!286 = !{!"cbIdx", i32 0}
!287 = !{!"pushableAddressGrfOffset", i32 -1}
!288 = !{!"pushableOffsetGrfOffset", i32 -1}
!289 = !{!"offset", i32 0}
!290 = !{!"size", i32 0}
!291 = !{!"isStateless", i1 false}
!292 = !{!"isBindless", i1 false}
!293 = !{!"simplePushLoads"}
!294 = !{!"simplePushInfoArrVec[1]", !286, !287, !288, !289, !290, !291, !292, !293}
!295 = !{!"simplePushInfoArrVec[2]", !286, !287, !288, !289, !290, !291, !292, !293}
!296 = !{!"simplePushInfoArrVec[3]", !286, !287, !288, !289, !290, !291, !292, !293}
!297 = !{!"simplePushBufferUsed", i32 0}
!298 = !{!"pushAnalysisWIInfos"}
!299 = !{!"inlineRTGlobalPtrOffset", i32 0}
!300 = !{!"rtSyncSurfPtrOffset", i32 0}
!301 = !{!"psInfo", !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316}
!302 = !{!"BlendStateDisabledMask", i8 0}
!303 = !{!"SkipSrc0Alpha", i1 false}
!304 = !{!"DualSourceBlendingDisabled", i1 false}
!305 = !{!"ForceEnableSimd32", i1 false}
!306 = !{!"outputDepth", i1 false}
!307 = !{!"outputStencil", i1 false}
!308 = !{!"outputMask", i1 false}
!309 = !{!"blendToFillEnabled", i1 false}
!310 = !{!"forceEarlyZ", i1 false}
!311 = !{!"hasVersionedLoop", i1 false}
!312 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!313 = !{!"NumSamples", i8 0}
!314 = !{!"blendOptimizationMode"}
!315 = !{!"colorOutputMask"}
!316 = !{!"WaDisableVRS", i1 false}
!317 = !{!"csInfo", !318, !319, !320, !321, !322, !13, !14, !323, !324, !325, !326, !327, !328, !329, !330, !43, !331, !332, !333}
!318 = !{!"maxWorkGroupSize", i32 0}
!319 = !{!"waveSize", i32 0}
!320 = !{!"ComputeShaderSecondCompile"}
!321 = !{!"forcedSIMDSize", i8 0}
!322 = !{!"forceTotalGRFNum", i32 0}
!323 = !{!"allowLowerSimd", i1 false}
!324 = !{!"disableSimd32Slicing", i1 false}
!325 = !{!"disableSplitOnSpill", i1 false}
!326 = !{!"forcedVISAPreRAScheduler", i1 false}
!327 = !{!"disableLocalIdOrderOptimizations", i1 false}
!328 = !{!"disableDispatchAlongY", i1 false}
!329 = !{!"neededThreadIdLayout", i1* null}
!330 = !{!"forceTileYWalk", i1 false}
!331 = !{!"walkOrderEnabled", i1 false}
!332 = !{!"walkOrderOverride", i32 0}
!333 = !{!"ResForHfPacking"}
!334 = !{!"msInfo", !335, !336, !337, !338, !339, !340, !341, !342, !343}
!335 = !{!"PrimitiveTopology", i32 3}
!336 = !{!"MaxNumOfPrimitives", i32 0}
!337 = !{!"MaxNumOfVertices", i32 0}
!338 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!339 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!340 = !{!"WorkGroupSize", i32 0}
!341 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!342 = !{!"IndexFormat", i32 6}
!343 = !{!"SubgroupSize", i32 0}
!344 = !{!"taskInfo", !345, !340, !341, !343}
!345 = !{!"MaxNumOfOutputs", i32 0}
!346 = !{!"NBarrierCnt", i32 0}
!347 = !{!"rtInfo", !348, !349, !350, !351, !352, !353, !354, !355, !356, !357, !358, !359}
!348 = !{!"RayQueryAllocSizeInBytes", i32 0}
!349 = !{!"NumContinuations", i32 0}
!350 = !{!"RTAsyncStackAddrspace", i32 -1}
!351 = !{!"RTAsyncStackSurfaceStateOffset", i1* null}
!352 = !{!"SWHotZoneAddrspace", i32 -1}
!353 = !{!"SWHotZoneSurfaceStateOffset", i1* null}
!354 = !{!"SWStackAddrspace", i32 -1}
!355 = !{!"SWStackSurfaceStateOffset", i1* null}
!356 = !{!"RTSyncStackAddrspace", i32 -1}
!357 = !{!"RTSyncStackSurfaceStateOffset", i1* null}
!358 = !{!"doSyncDispatchRays", i1 false}
!359 = !{!"MemStyle", !"Xe"}
!360 = !{!"CurUniqueIndirectIdx", i32 0}
!361 = !{!"inlineDynTextures"}
!362 = !{!"inlineResInfoData"}
!363 = !{!"immConstant", !364, !365, !366}
!364 = !{!"data"}
!365 = !{!"sizes"}
!366 = !{!"zeroIdxs"}
!367 = !{!"stringConstants"}
!368 = !{!"inlineConstantBuffers"}
!369 = !{!"inlineGlobalBuffers"}
!370 = !{!"GlobalPointerProgramBinaryInfos"}
!371 = !{!"ConstantPointerProgramBinaryInfos"}
!372 = !{!"GlobalBufferAddressRelocInfo"}
!373 = !{!"ConstantBufferAddressRelocInfo"}
!374 = !{!"forceLscCacheList"}
!375 = !{!"SrvMap"}
!376 = !{!"RasterizerOrderedByteAddressBuffer"}
!377 = !{!"RasterizerOrderedViews"}
!378 = !{!"MinNOSPushConstantSize", i32 0}
!379 = !{!"inlineProgramScopeOffsets"}
!380 = !{!"shaderData", !381}
!381 = !{!"numReplicas", i32 0}
!382 = !{!"URBInfo", !383, !384, !385}
!383 = !{!"has64BVertexHeaderInput", i1 false}
!384 = !{!"has64BVertexHeaderOutput", i1 false}
!385 = !{!"hasVertexHeader", i1 true}
!386 = !{!"UseBindlessImage", i1 false}
!387 = !{!"enableRangeReduce", i1 false}
!388 = !{!"allowMatchMadOptimizationforVS", i1 false}
!389 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!390 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!391 = !{!"statefulResourcesNotAliased", i1 false}
!392 = !{!"disableMixMode", i1 false}
!393 = !{!"genericAccessesResolved", i1 false}
!394 = !{!"PrivateMemoryPerFG", !395, !396, !397, !398, !399, !400, !401, !402, !403, !404, !405, !406, !407, !408, !409, !410, !411, !412}
!395 = !{!"PrivateMemoryPerFGMap[0]", void (%"class.sycl::_V1::range"*, %class.__generated_*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE}
!396 = !{!"PrivateMemoryPerFGValue[0]", i32 0}
!397 = !{!"PrivateMemoryPerFGMap[1]", void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i32, i32)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail}
!398 = !{!"PrivateMemoryPerFGValue[1]", i32 0}
!399 = !{!"PrivateMemoryPerFGMap[2]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i8, i8, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!400 = !{!"PrivateMemoryPerFGValue[2]", i32 0}
!401 = !{!"PrivateMemoryPerFGMap[3]", void (i8 addrspace(1)*, i8, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!402 = !{!"PrivateMemoryPerFGValue[3]", i32 0}
!403 = !{!"PrivateMemoryPerFGMap[4]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i16, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!404 = !{!"PrivateMemoryPerFGValue[4]", i32 0}
!405 = !{!"PrivateMemoryPerFGMap[5]", void (i16 addrspace(1)*, i16, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!406 = !{!"PrivateMemoryPerFGValue[5]", i32 0}
!407 = !{!"PrivateMemoryPerFGMap[6]", void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i32, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE}
!408 = !{!"PrivateMemoryPerFGValue[6]", i32 0}
!409 = !{!"PrivateMemoryPerFGMap[7]", void (i32 addrspace(1)*, i32, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_}
!410 = !{!"PrivateMemoryPerFGValue[7]", i32 0}
!411 = !{!"PrivateMemoryPerFGMap[8]", void (i32 addrspace(1)*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i32)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_}
!412 = !{!"PrivateMemoryPerFGValue[8]", i32 0}
!413 = !{!"m_OptsToDisable"}
!414 = !{!"capabilities", !415}
!415 = !{!"globalVariableDecorationsINTEL", i1 false}
!416 = !{!"m_ShaderResourceViewMcsMask", !417, !418}
!417 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!418 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!419 = !{!"computedDepthMode", i32 0}
!420 = !{!"isHDCFastClearShader", i1 false}
!421 = !{void (%"class.sycl::_V1::range"*, %class.__generated_*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE, !422}
!422 = !{!423, !424}
!423 = !{!"function_type", i32 0}
!424 = !{!"implicit_arg_desc", !425, !426, !427, !428, !429, !430, !431, !432, !433, !436, !438, !440, !442, !443, !444, !446, !448, !450, !452, !454, !456}
!425 = !{i32 0}
!426 = !{i32 1}
!427 = !{i32 4}
!428 = !{i32 6}
!429 = !{i32 7}
!430 = !{i32 8}
!431 = !{i32 9}
!432 = !{i32 12}
!433 = !{i32 16, !434, !435}
!434 = !{!"explicit_arg_num", i32 0}
!435 = !{!"struct_arg_offset", i32 0}
!436 = !{i32 16, !434, !437}
!437 = !{!"struct_arg_offset", i32 8}
!438 = !{i32 16, !434, !439}
!439 = !{!"struct_arg_offset", i32 16}
!440 = !{i32 16, !441, !435}
!441 = !{!"explicit_arg_num", i32 1}
!442 = !{i32 16, !441, !437}
!443 = !{i32 16, !441, !439}
!444 = !{i32 16, !441, !445}
!445 = !{!"struct_arg_offset", i32 24}
!446 = !{i32 16, !441, !447}
!447 = !{!"struct_arg_offset", i32 32}
!448 = !{i32 16, !441, !449}
!449 = !{!"struct_arg_offset", i32 40}
!450 = !{i32 16, !441, !451}
!451 = !{!"struct_arg_offset", i32 48}
!452 = !{i32 16, !441, !453}
!453 = !{!"struct_arg_offset", i32 56}
!454 = !{i32 16, !441, !455}
!455 = !{!"struct_arg_offset", i32 64}
!456 = !{i32 16, !441, !457}
!457 = !{!"struct_arg_offset", i32 72}
!458 = !{void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i32, i32)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail, !459}
!459 = !{!423, !460}
!460 = !{!"implicit_arg_desc", !425, !426, !428, !429, !430, !431, !432, !461, !463, !464, !465, !467, !468, !469, !470}
!461 = !{i32 16, !462, !435}
!462 = !{!"explicit_arg_num", i32 2}
!463 = !{i32 16, !462, !437}
!464 = !{i32 16, !462, !439}
!465 = !{i32 16, !466, !435}
!466 = !{!"explicit_arg_num", i32 5}
!467 = !{i32 16, !466, !437}
!468 = !{i32 16, !466, !439}
!469 = !{i32 14, !434}
!470 = !{i32 14, !471}
!471 = !{!"explicit_arg_num", i32 3}
!472 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i8, i8, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !473}
!473 = !{!423, !474}
!474 = !{!"implicit_arg_desc", !425, !426, !427, !428, !429, !430, !431, !432, !433, !440, !475, !476, !478, !480, !482, !484, !486, !488}
!475 = !{i32 19, !441, !437}
!476 = !{i32 19, !441, !477}
!477 = !{!"struct_arg_offset", i32 9}
!478 = !{i32 19, !441, !479}
!479 = !{!"struct_arg_offset", i32 10}
!480 = !{i32 19, !441, !481}
!481 = !{!"struct_arg_offset", i32 11}
!482 = !{i32 19, !441, !483}
!483 = !{!"struct_arg_offset", i32 12}
!484 = !{i32 19, !441, !485}
!485 = !{!"struct_arg_offset", i32 13}
!486 = !{i32 19, !441, !487}
!487 = !{!"struct_arg_offset", i32 14}
!488 = !{i32 19, !441, !489}
!489 = !{!"struct_arg_offset", i32 15}
!490 = !{void (i8 addrspace(1)*, i8, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_, !491}
!491 = !{!423, !492}
!492 = !{!"implicit_arg_desc", !425, !426, !428, !429, !430, !431, !469}
!493 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i16, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !494}
!494 = !{!423, !495}
!495 = !{!"implicit_arg_desc", !425, !426, !427, !428, !429, !430, !431, !432, !433, !440, !496, !478, !480, !482, !484, !486, !488}
!496 = !{i32 18, !441, !437}
!497 = !{void (i16 addrspace(1)*, i16, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_, !491}
!498 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i32, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !499}
!499 = !{!423, !500}
!500 = !{!"implicit_arg_desc", !425, !426, !427, !428, !429, !430, !431, !432, !433, !440, !501, !482, !484, !486, !488}
!501 = !{i32 17, !441, !437}
!502 = !{void (i32 addrspace(1)*, i32, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_, !491}
!503 = !{void (i32 addrspace(1)*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i32)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_, !504}
!504 = !{!423, !505}
!505 = !{!"implicit_arg_desc", !425, !426, !506, !429, !430, !431, !432, !469}
!506 = !{i32 5}
!507 = !{i32 2, i32 0}
!508 = !{!"clang version 14.0.5"}
!509 = !{i32 1, !"wchar_size", i32 4}
!510 = !{!511, !511, i64 0}
!511 = !{!"int", !512, i64 0}
!512 = !{!"omnipotent char", !513, i64 0}
!513 = !{!"Simple C/C++ TBAA"}
