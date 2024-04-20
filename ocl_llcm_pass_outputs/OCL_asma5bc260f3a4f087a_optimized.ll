; ------------------------------------------------
; OCL_asma5bc260f3a4f087a_optimized.ll
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

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE(%"class.sycl::_V1::range"* byval(%"class.sycl::_V1::range") %0, %class.__generated_* byval(%class.__generated_) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i64 %const_reg_qword2, i64 %const_reg_qword3, i64 %const_reg_qword4, i64 %const_reg_qword5, i64 %const_reg_qword6, i64 %const_reg_qword7, i64 %const_reg_qword8, i64 %const_reg_qword9, i64 %const_reg_qword10, i64 %const_reg_qword11, i64 %const_reg_qword12) #0 {
  %3 = extractelement <3 x i32> %globalSize, i64 0
  %4 = extractelement <3 x i32> %globalSize, i64 1
  %5 = extractelement <3 x i32> %globalSize, i64 2
  %6 = extractelement <8 x i32> %payloadHeader, i64 0
  %7 = extractelement <8 x i32> %payloadHeader, i64 1
  %8 = extractelement <8 x i32> %payloadHeader, i64 2
  %9 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %10 = extractelement <3 x i32> %enqueuedLocalSize, i64 1
  %11 = extractelement <3 x i32> %enqueuedLocalSize, i64 2
  %12 = extractelement <8 x i32> %r0, i64 1
  %13 = extractelement <8 x i32> %r0, i64 6
  %14 = extractelement <8 x i32> %r0, i64 7
  %15 = inttoptr i64 %const_reg_qword3 to i8 addrspace(4)*
  %16 = inttoptr i64 %const_reg_qword8 to i8 addrspace(4)*
  %mul.i15.i.i = mul i32 %11, %14
  %localIdZ27 = zext i16 %localIdZ to i32
  %add.i17.i.i = add i32 %mul.i15.i.i, %localIdZ27
  %add4.i19.i.i = add i32 %add.i17.i.i, %8
  %conv.i20.i.i = zext i32 %add4.i19.i.i to i64
  %mul.i7.i.i15 = mul i32 %10, %13
  %localIdY41 = zext i16 %localIdY to i32
  %add.i9.i.i18 = add i32 %mul.i7.i.i15, %localIdY41
  %add4.i11.i.i20 = add i32 %add.i9.i.i18, %7
  %conv.i12.i.i21 = zext i32 %add4.i11.i.i20 to i64
  %mul.i.i.i35 = mul i32 %9, %12
  %localIdX55 = zext i16 %localIdX to i32
  %add.i.i.i38 = add i32 %mul.i.i.i35, %localIdX55
  %add4.i.i.i40 = add i32 %add.i.i.i38, %6
  %conv.i.i.i41 = zext i32 %add4.i.i.i40 to i64
  %conv5.i70 = zext i32 %5 to i64
  %conv2.i76 = zext i32 %4 to i64
  %conv.i = zext i32 %3 to i64
  %17 = icmp ult i64 %conv.i20.i.i, %const_reg_qword
  %18 = icmp ult i64 %conv.i12.i.i21, %const_reg_qword1
  %19 = icmp ult i64 %conv.i.i.i41, %const_reg_qword2
  %20 = select i1 %19, i1 %18, i1 false
  %narrow140 = select i1 %20, i1 %17, i1 false
  br i1 %narrow140, label %.lr.ph, label %._crit_edge99

.lr.ph:                                           ; preds = %._crit_edge, %2
  %21 = phi i64 [ %48, %._crit_edge ], [ %conv.i.i.i41, %2 ]
  %22 = phi i64 [ %49, %._crit_edge ], [ %conv.i12.i.i21, %2 ]
  %23 = phi i64 [ %50, %._crit_edge ], [ %conv.i20.i.i, %2 ]
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = icmp ult i64 %22, 2147483648
  call void @llvm.assume(i1 %25)
  %26 = icmp ult i64 %21, 2147483648
  call void @llvm.assume(i1 %26)
  %27 = mul i64 %21, %const_reg_qword9
  %28 = mul i64 %22, %const_reg_qword10
  %29 = getelementptr i8, i8 addrspace(4)* %16, i64 %27
  %30 = getelementptr i8, i8 addrspace(4)* %29, i64 %28
  %31 = getelementptr i8, i8 addrspace(4)* %30, i64 %23
  %32 = addrspacecast i8 addrspace(4)* %31 to i8 addrspace(1)*
  %33 = load i8, i8 addrspace(1)* %32, align 1
  %34 = mul i64 %21, %const_reg_qword4
  %35 = mul i64 %22, %const_reg_qword5
  %36 = getelementptr i8, i8 addrspace(4)* %15, i64 %34
  %37 = getelementptr i8, i8 addrspace(4)* %36, i64 %35
  %38 = getelementptr i8, i8 addrspace(4)* %37, i64 %23
  %39 = addrspacecast i8 addrspace(4)* %38 to i8 addrspace(1)*
  store i8 %33, i8 addrspace(1)* %39, align 1
  %40 = add nuw nsw i64 %23, %conv5.i70
  %41 = icmp ult i64 %40, %const_reg_qword
  br i1 %41, label %._crit_edge, label %42

42:                                               ; preds = %.lr.ph
  %43 = add nuw nsw i64 %22, %conv2.i76
  %44 = icmp ult i64 %43, %const_reg_qword1
  br i1 %44, label %._crit_edge, label %45

45:                                               ; preds = %42
  %46 = add nuw nsw i64 %21, %conv.i
  %47 = icmp ult i64 %46, %const_reg_qword2
  br i1 %47, label %._crit_edge, label %._crit_edge99

._crit_edge:                                      ; preds = %.lr.ph, %42, %45
  %48 = phi i64 [ %21, %.lr.ph ], [ %21, %42 ], [ %46, %45 ]
  %49 = phi i64 [ %22, %.lr.ph ], [ %43, %42 ], [ %conv.i12.i.i21, %45 ]
  %50 = phi i64 [ %40, %.lr.ph ], [ %conv.i20.i.i, %42 ], [ %conv.i20.i.i, %45 ]
  br label %.lr.ph

._crit_edge99:                                    ; preds = %45, %2
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
  %7 = extractelement <8 x i32> %payloadHeader, i64 0
  %8 = extractelement <8 x i32> %payloadHeader, i64 1
  %9 = extractelement <8 x i32> %payloadHeader, i64 2
  %10 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %11 = extractelement <3 x i32> %enqueuedLocalSize, i64 1
  %12 = extractelement <3 x i32> %enqueuedLocalSize, i64 2
  %13 = extractelement <8 x i32> %r0, i64 1
  %14 = extractelement <8 x i32> %r0, i64 6
  %15 = extractelement <8 x i32> %r0, i64 7
  %mul.i15.i.i25 = mul i32 %12, %15
  %localIdZ21 = zext i16 %localIdZ to i32
  %add.i17.i.i28 = add i32 %mul.i15.i.i25, %localIdZ21
  %add4.i19.i.i30 = add i32 %add.i17.i.i28, %9
  %conv.i20.i.i31 = zext i32 %add4.i19.i.i30 to i64
  %mul.i7.i.i45 = mul i32 %11, %14
  %localIdY35 = zext i16 %localIdY to i32
  %add.i9.i.i48 = add i32 %mul.i7.i.i45, %localIdY35
  %add4.i11.i.i50 = add i32 %add.i9.i.i48, %8
  %conv.i12.i.i51 = zext i32 %add4.i11.i.i50 to i64
  %mul.i.i.i = mul i32 %10, %13
  %localIdX49 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX49
  %add4.i.i.i = add i32 %add.i.i.i, %7
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %16 = icmp sgt i32 %add4.i19.i.i30, -1
  call void @llvm.assume(i1 %16)
  %17 = icmp sgt i32 %add4.i11.i.i50, -1
  call void @llvm.assume(i1 %17)
  %18 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %18)
  %19 = mul i64 %conv.i.i.i, %4
  %20 = mul i64 %conv.i12.i.i51, %const_reg_qword3
  %21 = getelementptr i8, i8 addrspace(1)* %3, i64 %19
  %22 = getelementptr i8, i8 addrspace(1)* %21, i64 %20
  %23 = getelementptr i8, i8 addrspace(1)* %22, i64 %conv.i20.i.i31
  %24 = load i8, i8 addrspace(1)* %23, align 1
  %25 = mul i64 %conv.i.i.i, %1
  %26 = mul i64 %conv.i12.i.i51, %const_reg_qword
  %27 = getelementptr i8, i8 addrspace(1)* %0, i64 %25
  %28 = getelementptr i8, i8 addrspace(1)* %27, i64 %26
  %29 = getelementptr i8, i8 addrspace(1)* %28, i64 %conv.i20.i.i31
  store i8 %24, i8 addrspace(1)* %29, align 1
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.2* byval(%class.__generated_.2) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4, i8 %const_reg_byte5, i8 %const_reg_byte6, i8 %const_reg_byte7, i8 %const_reg_byte8) #0 {
  %3 = extractelement <3 x i32> %globalSize, i64 0
  %4 = extractelement <8 x i32> %payloadHeader, i64 0
  %5 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %6 = extractelement <8 x i32> %r0, i64 1
  %7 = inttoptr i64 %const_reg_qword1 to i8 addrspace(4)*
  %mul.i.i.i = mul i32 %5, %6
  %localIdX10 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX10
  %add4.i.i.i = add i32 %add.i.i.i, %4
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %conv.i = zext i32 %3 to i64
  %8 = icmp ult i64 %conv.i.i.i, %const_reg_qword
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2, %.lr.ph
  %9 = phi i64 [ %15, %.lr.ph ], [ %conv.i.i.i, %2 ]
  %10 = icmp ult i64 %9, 2147483648
  call void @llvm.assume(i1 %10)
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 %9
  %12 = addrspacecast i8 addrspace(4)* %11 to i8 addrspace(1)*
  store i8 %const_reg_byte, i8 addrspace(1)* %12, align 1
  %13 = add nuw nsw i64 %9, %conv.i
  %14 = icmp ult i64 %13, %const_reg_qword
  %15 = select i1 %14, i64 %13, i64 %conv.i.i.i
  br i1 %14, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %2
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_(i8 addrspace(1)* %0, i8 zeroext %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i64 0
  %4 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %5 = extractelement <8 x i32> %r0, i64 1
  %mul.i.i.i = mul i32 %4, %5
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %6 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %6)
  %7 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %conv.i.i.i
  store i8 %1, i8 addrspace(1)* %7, align 1
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.9* byval(%class.__generated_.9) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i16 %const_reg_word, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4, i8 %const_reg_byte5, i8 %const_reg_byte6) #0 {
  %3 = extractelement <3 x i32> %globalSize, i64 0
  %4 = extractelement <8 x i32> %payloadHeader, i64 0
  %5 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %6 = extractelement <8 x i32> %r0, i64 1
  %7 = inttoptr i64 %const_reg_qword1 to i16 addrspace(4)*
  %mul.i.i.i = mul i32 %5, %6
  %localIdX8 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX8
  %add4.i.i.i = add i32 %add.i.i.i, %4
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %conv.i = zext i32 %3 to i64
  %8 = icmp ult i64 %conv.i.i.i, %const_reg_qword
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2, %.lr.ph
  %9 = phi i64 [ %15, %.lr.ph ], [ %conv.i.i.i, %2 ]
  %10 = icmp ult i64 %9, 2147483648
  call void @llvm.assume(i1 %10)
  %11 = getelementptr inbounds i16, i16 addrspace(4)* %7, i64 %9
  %12 = addrspacecast i16 addrspace(4)* %11 to i16 addrspace(1)*
  store i16 %const_reg_word, i16 addrspace(1)* %12, align 2
  %13 = add nuw nsw i64 %9, %conv.i
  %14 = icmp ult i64 %13, %const_reg_qword
  %15 = select i1 %14, i64 %13, i64 %conv.i.i.i
  br i1 %14, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %2
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_(i16 addrspace(1)* %0, i16 zeroext %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i64 0
  %4 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %5 = extractelement <8 x i32> %r0, i64 1
  %mul.i.i.i = mul i32 %4, %5
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %6 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %6)
  %7 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %conv.i.i.i
  store i16 %1, i16 addrspace(1)* %7, align 2
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE(%"class.sycl::_V1::range.0"* byval(%"class.sycl::_V1::range.0") %0, %class.__generated_.12* byval(%class.__generated_.12) %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i64 %const_reg_qword, i64 %const_reg_qword1, i32 %const_reg_dword, i8 %const_reg_byte, i8 %const_reg_byte2, i8 %const_reg_byte3, i8 %const_reg_byte4) #0 {
  %3 = extractelement <3 x i32> %globalSize, i64 0
  %4 = extractelement <8 x i32> %payloadHeader, i64 0
  %5 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %6 = extractelement <8 x i32> %r0, i64 1
  %7 = inttoptr i64 %const_reg_qword1 to i32 addrspace(4)*
  %mul.i.i.i = mul i32 %5, %6
  %localIdX6 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX6
  %add4.i.i.i = add i32 %add.i.i.i, %4
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %conv.i = zext i32 %3 to i64
  %8 = icmp ult i64 %conv.i.i.i, %const_reg_qword
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2, %.lr.ph
  %9 = phi i64 [ %15, %.lr.ph ], [ %conv.i.i.i, %2 ]
  %10 = icmp ult i64 %9, 2147483648
  call void @llvm.assume(i1 %10)
  %11 = getelementptr inbounds i32, i32 addrspace(4)* %7, i64 %9
  %12 = addrspacecast i32 addrspace(4)* %11 to i32 addrspace(1)*
  store i32 %const_reg_dword, i32 addrspace(1)* %12, align 4
  %13 = add nuw nsw i64 %9, %conv.i
  %14 = icmp ult i64 %13, %const_reg_qword
  %15 = select i1 %14, i64 %13, i64 %conv.i.i.i
  br i1 %14, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %2
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_(i32 addrspace(1)* %0, i32 %1, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i32 %bufferOffset) #0 {
  %3 = extractelement <8 x i32> %payloadHeader, i64 0
  %4 = extractelement <3 x i32> %enqueuedLocalSize, i64 0
  %5 = extractelement <8 x i32> %r0, i64 1
  %mul.i.i.i = mul i32 %4, %5
  %localIdX2 = zext i16 %localIdX to i32
  %add.i.i.i = add i32 %mul.i.i.i, %localIdX2
  %add4.i.i.i = add i32 %add.i.i.i, %3
  %conv.i.i.i = zext i32 %add4.i.i.i to i64
  %6 = icmp sgt i32 %add4.i.i.i, -1
  call void @llvm.assume(i1 %6)
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %conv.i.i.i
  store i32 %1, i32 addrspace(1)* %7, align 4
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_(i32 addrspace(1)* %0, <8 x i32> %r0, <8 x i32> %payloadHeader, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, i8* %privateBase, i32 %bufferOffset) #0 {
  %2 = extractelement <3 x i32> %localSize, i64 0
  %3 = extractelement <3 x i32> %localSize, i64 1
  %4 = extractelement <3 x i32> %localSize, i64 2
  %conv.i.i = zext i16 %localIdX to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %conv.i.i
  %6 = load i32, i32 addrspace(1)* %5, align 4
  %7 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %6, i8 0, i32 0)
  %8 = bitcast <8 x i32> %r0 to <32 x i8>
  %9 = extractelement <32 x i8> %8, i64 8
  %localThreadId4 = zext i8 %9 to i32
  %mul.i.i.i.i = mul i32 %3, %2
  %mul3.i.i.i.i = mul i32 %mul.i.i.i.i, %4
  %simdSize = call i32 @llvm.genx.GenISA.simdSize()
  %cmp.i.i.i.i = icmp ugt i32 %simdSize, 7
  call void @llvm.assume(i1 %cmp.i.i.i.i) #9
  %cmp1.i.i.i.i = icmp ult i32 %simdSize, 33
  call void @llvm.assume(i1 %cmp1.i.i.i.i) #9
  %add.i1.i.i = add nsw i32 %simdSize, -1
  %sub.i.i.i = add i32 %add.i1.i.i, %mul3.i.i.i.i
  %10 = lshr i32 %simdSize, 4
  %11 = lshr i32 %sub.i.i.i, 3
  %12 = lshr i32 %11, %10
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %cmp1.i.i.i = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %cmp1.i.i.i) #9
  %and.i.i.i = and i32 %add.i1.i.i, %mul3.i.i.i.i
  %cmp.i.i.i = icmp eq i32 %and.i.i.i, 0
  br i1 %cmp.i.i.i, label %cond.true.i.i.i, label %lor.rhs.i.i.i

lor.rhs.i.i.i:                                    ; preds = %1
  %13 = add i32 %mul3.i.i.i.i, %simdSize
  %sub.i.i.i.i = add i32 %13, -1
  %14 = lshr i32 %sub.i.i.i.i, 3
  %15 = lshr i32 %14, %10
  %sub4.i.i.i = add nsw i32 %15, -1
  %cmp5.i.i.i = icmp ugt i32 %sub4.i.i.i, %localThreadId4
  br i1 %cmp5.i.i.i, label %cond.true.i.i.i, label %__builtin_spirv_BuiltInSubgroupSize.exit.i.i

cond.true.i.i.i:                                  ; preds = %lor.rhs.i.i.i, %1
  br label %__builtin_spirv_BuiltInSubgroupSize.exit.i.i

__builtin_spirv_BuiltInSubgroupSize.exit.i.i:     ; preds = %lor.rhs.i.i.i, %cond.true.i.i.i
  %cond.i.i.i = phi i32 [ %simdSize, %cond.true.i.i.i ], [ %and.i.i.i, %lor.rhs.i.i.i ]
  %cmp.i.i = icmp eq i16 %simdLaneId16, 0
  br i1 %cmp.i.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %__builtin_spirv_BuiltInSubgroupSize.exit.i.i
  %idxprom.i.i = zext i8 %9 to i64
  %arrayidx.i.i = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*), i64 %idxprom.i.i
  store i32 %7, i32 addrspace(3)* %arrayidx.i.i, align 4, !tbaa !492
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %__builtin_spirv_BuiltInSubgroupSize.exit.i.i, %if.then.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %mul.i.i = mul nuw nsw i32 %simdSize, %localThreadId4
  %add.i1.i = add nuw nsw i32 %mul.i.i, %simdLaneId
  %cmp797.i.i = icmp ugt i32 %12, %simdSize
  br i1 %cmp797.i.i, label %while.body.lr.ph.i.i, label %while.end.i.i

while.body.lr.ph.i.i:                             ; preds = %if.end.i.i
  %idxprom11.i.i = zext i32 %add.i1.i to i64
  %arrayidx12.i.i = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*), i64 %idxprom11.i.i
  %idxprom18.i.i = zext i8 %9 to i64
  %arrayidx19.i.i = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*), i64 %idxprom18.i.i
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %if.end21.i.i, %while.body.lr.ph.i.i
  %values_num.098.i.i = phi i32 [ %12, %while.body.lr.ph.i.i ], [ %17, %if.end21.i.i ]
  %sub.i.i = add nsw i32 %add.i1.i.i, %values_num.098.i.i
  %16 = lshr i32 %sub.i.i, 3
  %17 = lshr i32 %16, %10
  %mul9.i.i = mul i32 %17, %simdSize
  %cmp10.i.i = icmp ult i32 %add.i1.i, %values_num.098.i.i
  br i1 %cmp10.i.i, label %cond.true.i.i, label %cond.end.i.i

cond.true.i.i:                                    ; preds = %while.body.i.i
  %18 = load i32, i32 addrspace(3)* %arrayidx12.i.i, align 4, !tbaa !492
  br label %cond.end.i.i

cond.end.i.i:                                     ; preds = %while.body.i.i, %cond.true.i.i
  %cond.i.i = phi i32 [ %18, %cond.true.i.i ], [ 0, %while.body.i.i ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %cmp13.i.i = icmp ult i32 %add.i1.i, %mul9.i.i
  br i1 %cmp13.i.i, label %if.then14.i.i, label %if.end21.i.i

if.then14.i.i:                                    ; preds = %cond.end.i.i
  %19 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %cond.i.i, i8 0, i32 0)
  br i1 %cmp.i.i, label %if.then17.i.i, label %if.end21.i.i

if.then17.i.i:                                    ; preds = %if.then14.i.i
  store i32 %19, i32 addrspace(3)* %arrayidx19.i.i, align 4, !tbaa !492
  br label %if.end21.i.i

if.end21.i.i:                                     ; preds = %if.then14.i.i, %cond.end.i.i, %if.then17.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %cmp7.i.i = icmp ugt i32 %17, %simdSize
  br i1 %cmp7.i.i, label %while.body.i.i, label %while.end.i.i

while.end.i.i:                                    ; preds = %if.end21.i.i, %if.end.i.i
  %values_num.0.lcssa.i.i = phi i32 [ %12, %if.end.i.i ], [ %17, %if.end21.i.i ]
  %cmp23.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, %cond.i.i.i
  br i1 %cmp23.i.i, label %if.then24.i.i, label %if.else.i.i

if.then24.i.i:                                    ; preds = %while.end.i.i
  %20 = load i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*), align 4, !tbaa !492
  %cmp2699.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, 1
  br i1 %cmp2699.i.i, label %for.body.i.i, label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

for.body.i.i:                                     ; preds = %if.then24.i.i, %for.body.i.i
  %s.0101.i.i = phi i32 [ %inc.i.i, %for.body.i.i ], [ 1, %if.then24.i.i ]
  %sg_aggregate.0100.i.i = phi i32 [ %add.i.i.i, %for.body.i.i ], [ %20, %if.then24.i.i ]
  %idxprom27.i.i = zext i32 %s.0101.i.i to i64
  %arrayidx28.i.i = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*), i64 %idxprom27.i.i
  %21 = load i32, i32 addrspace(3)* %arrayidx28.i.i, align 4, !tbaa !492
  %add.i.i.i = add nsw i32 %21, %sg_aggregate.0100.i.i
  %inc.i.i = add nuw nsw i32 %s.0101.i.i, 1
  %cmp26.i.i = icmp ult i32 %inc.i.i, %values_num.0.lcssa.i.i
  br i1 %cmp26.i.i, label %for.body.i.i, label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

if.else.i.i:                                      ; preds = %while.end.i.i
  %cmp31.i.i = icmp ugt i32 %values_num.0.lcssa.i.i, %simdLaneId
  br i1 %cmp31.i.i, label %cond.true32.i.i, label %cond.end36.i.i

cond.true32.i.i:                                  ; preds = %if.else.i.i
  %idxprom33.i.i = zext i16 %simdLaneId16 to i64
  %arrayidx34.i.i = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @GenSLM.LocalMemPoolOnGetMemPoolPtr to i32 addrspace(3)*), i64 %idxprom33.i.i
  %22 = load i32, i32 addrspace(3)* %arrayidx34.i.i, align 4, !tbaa !492
  br label %cond.end36.i.i

cond.end36.i.i:                                   ; preds = %if.else.i.i, %cond.true32.i.i
  %cond37.i.i = phi i32 [ %22, %cond.true32.i.i ], [ 0, %if.else.i.i ]
  %23 = call i32 @llvm.genx.GenISA.WaveAll.i32(i32 %cond37.i.i, i8 0, i32 0)
  br label %__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit

__builtin_spirv_OpGroupIAdd_i32_i32_i32.exit:     ; preds = %for.body.i.i, %if.then24.i.i, %cond.end36.i.i
  %result.0.i.i = phi i32 [ %23, %cond.end36.i.i ], [ %20, %if.then24.i.i ], [ %add.i.i.i, %for.body.i.i ]
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
!igc.functions = !{!403, !440, !454, !472, !475, !479, !480, !484, !485}
!opencl.ocl.version = !{!489, !489, !489, !489, !489}
!opencl.spir.version = !{!489, !489, !489, !489, !489}
!llvm.ident = !{!490, !490, !490, !490, !490}
!llvm.module.flags = !{!491}

!0 = !{!"ModuleMD", !1, !2, !70, !271, !301, !317, !334, !344, !346, !347, !360, !361, !362, !363, !367, !368, !369, !370, !371, !372, !373, !374, !375, !376, !377, !378, !379, !380, !382, !386, !387, !388, !389, !390, !391, !392, !393, !141, !394, !395, !396, !398, !401, !402}
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
!394 = !{!"PrivateMemoryPerFG"}
!395 = !{!"m_OptsToDisable"}
!396 = !{!"capabilities", !397}
!397 = !{!"globalVariableDecorationsINTEL", i1 false}
!398 = !{!"m_ShaderResourceViewMcsMask", !399, !400}
!399 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!400 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!401 = !{!"computedDepthMode", i32 0}
!402 = !{!"isHDCFastClearShader", i1 false}
!403 = !{void (%"class.sycl::_V1::range"*, %class.__generated_*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)* @_ZTSN4sycl3_V16detail19__pf_kernel_wrapperIZZN4dpct6detailL11dpct_memcpyERNS0_5queueEPvPKvNS0_5rangeILi3EEESB_NS0_2idILi3EEESD_SB_NS3_16memcpy_directionERKSt6vectorINS0_5eventESaISG_EEENKUlRNS0_7handlerEE_clESM_E21dpct_memcpy_3d_detailEE, !404}
!404 = !{!405, !406}
!405 = !{!"function_type", i32 0}
!406 = !{!"implicit_arg_desc", !407, !408, !409, !410, !411, !412, !413, !414, !415, !418, !420, !422, !424, !425, !426, !428, !430, !432, !434, !436, !438}
!407 = !{i32 0}
!408 = !{i32 1}
!409 = !{i32 4}
!410 = !{i32 6}
!411 = !{i32 7}
!412 = !{i32 8}
!413 = !{i32 9}
!414 = !{i32 12}
!415 = !{i32 16, !416, !417}
!416 = !{!"explicit_arg_num", i32 0}
!417 = !{!"struct_arg_offset", i32 0}
!418 = !{i32 16, !416, !419}
!419 = !{!"struct_arg_offset", i32 8}
!420 = !{i32 16, !416, !421}
!421 = !{!"struct_arg_offset", i32 16}
!422 = !{i32 16, !423, !417}
!423 = !{!"explicit_arg_num", i32 1}
!424 = !{i32 16, !423, !419}
!425 = !{i32 16, !423, !421}
!426 = !{i32 16, !423, !427}
!427 = !{!"struct_arg_offset", i32 24}
!428 = !{i32 16, !423, !429}
!429 = !{!"struct_arg_offset", i32 32}
!430 = !{i32 16, !423, !431}
!431 = !{!"struct_arg_offset", i32 40}
!432 = !{i32 16, !423, !433}
!433 = !{!"struct_arg_offset", i32 48}
!434 = !{i32 16, !423, !435}
!435 = !{!"struct_arg_offset", i32 56}
!436 = !{i32 16, !423, !437}
!437 = !{!"struct_arg_offset", i32 64}
!438 = !{i32 16, !423, !439}
!439 = !{!"struct_arg_offset", i32 72}
!440 = !{void (i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, i8 addrspace(1)*, i64, %"class.sycl::_V1::range"*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i64, i64, i64, i64, i32, i32)* @_ZTSZZN4dpct6detailL11dpct_memcpyERN4sycl3_V15queueEPvPKvNS2_5rangeILi3EEES9_NS2_2idILi3EEESB_S9_NS_16memcpy_directionERKSt6vectorINS2_5eventESaISE_EEENKUlRNS2_7handlerEE_clESK_E21dpct_memcpy_3d_detail, !441}
!441 = !{!405, !442}
!442 = !{!"implicit_arg_desc", !407, !408, !410, !411, !412, !413, !414, !443, !445, !446, !447, !449, !450, !451, !452}
!443 = !{i32 16, !444, !417}
!444 = !{!"explicit_arg_num", i32 2}
!445 = !{i32 16, !444, !419}
!446 = !{i32 16, !444, !421}
!447 = !{i32 16, !448, !417}
!448 = !{!"explicit_arg_num", i32 5}
!449 = !{i32 16, !448, !419}
!450 = !{i32 16, !448, !421}
!451 = !{i32 14, !416}
!452 = !{i32 14, !453}
!453 = !{!"explicit_arg_num", i32 3}
!454 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.2*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i8, i8, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !455}
!455 = !{!405, !456}
!456 = !{!"implicit_arg_desc", !407, !408, !409, !410, !411, !412, !413, !414, !415, !422, !457, !458, !460, !462, !464, !466, !468, !470}
!457 = !{i32 19, !423, !419}
!458 = !{i32 19, !423, !459}
!459 = !{!"struct_arg_offset", i32 9}
!460 = !{i32 19, !423, !461}
!461 = !{!"struct_arg_offset", i32 10}
!462 = !{i32 19, !423, !463}
!463 = !{!"struct_arg_offset", i32 11}
!464 = !{i32 19, !423, !465}
!465 = !{!"struct_arg_offset", i32 12}
!466 = !{i32 19, !423, !467}
!467 = !{!"struct_arg_offset", i32 13}
!468 = !{i32 19, !423, !469}
!469 = !{!"struct_arg_offset", i32 14}
!470 = !{i32 19, !423, !471}
!471 = !{!"struct_arg_offset", i32 15}
!472 = !{void (i8 addrspace(1)*, i8, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIhEEvPvRKT_mEUlNS0_2idILi1EEEE_, !473}
!473 = !{!405, !474}
!474 = !{!"implicit_arg_desc", !407, !408, !410, !411, !412, !413, !451}
!475 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.9*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i16, i8, i8, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !476}
!476 = !{!405, !477}
!477 = !{!"implicit_arg_desc", !407, !408, !409, !410, !411, !412, !413, !414, !415, !422, !478, !460, !462, !464, !466, !468, !470}
!478 = !{i32 18, !423, !419}
!479 = !{void (i16 addrspace(1)*, i16, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillItEEvPvRKT_mEUlNS0_2idILi1EEEE_, !473}
!480 = !{void (%"class.sycl::_V1::range.0"*, %class.__generated_.12*, <8 x i32>, <8 x i32>, <3 x i32>, <3 x i32>, i16, i16, i16, i8*, i64, i64, i32, i8, i8, i8, i8)* @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZNS0_7handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_EE, !481}
!481 = !{!405, !482}
!482 = !{!"implicit_arg_desc", !407, !408, !409, !410, !411, !412, !413, !414, !415, !422, !483, !464, !466, !468, !470}
!483 = !{i32 17, !423, !419}
!484 = !{void (i32 addrspace(1)*, i32, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i32)* @_ZTSZN4sycl3_V17handler4fillIjEEvPvRKT_mEUlNS0_2idILi1EEEE_, !473}
!485 = !{void (i32 addrspace(1)*, <8 x i32>, <8 x i32>, <3 x i32>, i16, i16, i16, i8*, i32)* @_ZTSZZ18call_command_queuePiENKUlRN4sycl3_V17handlerEE_clES3_EUlNS1_7nd_itemILi3EEEE_, !486}
!486 = !{!405, !487}
!487 = !{!"implicit_arg_desc", !407, !408, !488, !411, !412, !413, !414, !451}
!488 = !{i32 5}
!489 = !{i32 2, i32 0}
!490 = !{!"clang version 14.0.5"}
!491 = !{i32 1, !"wchar_size", i32 4}
!492 = !{!493, !493, i64 0}
!493 = !{!"int", !494, i64 0}
!494 = !{!"omnipotent char", !495, i64 0}
!495 = !{!"Simple C/C++ TBAA"}
