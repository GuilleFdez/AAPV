; ModuleID = 'C:/Users/guill/Documents/Overlay/aapv/aapv/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_time_img_ir([1024 x float]* %avg, [1024 x i32]* %cnt, [1024 x float]* %res) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 4194304)
  %avg_copy = bitcast i8* %malloccall to [1024 x [1024 x float]]*
  %malloccall1 = tail call i8* @malloc(i64 4194304)
  %cnt_copy = bitcast i8* %malloccall1 to [1024 x [1024 x i32]]*
  %malloccall2 = tail call i8* @malloc(i64 4194304)
  %res_copy = bitcast i8* %malloccall2 to [1024 x [1024 x float]]*
  %0 = bitcast [1024 x float]* %avg to [1024 x [1024 x float]]*
  %1 = bitcast [1024 x i32]* %cnt to [1024 x [1024 x i32]]*
  %2 = bitcast [1024 x float]* %res to [1024 x [1024 x float]]*
  call fastcc void @copy_in([1024 x [1024 x float]]* %0, [1024 x [1024 x float]]* %avg_copy, [1024 x [1024 x i32]]* %1, [1024 x [1024 x i32]]* %cnt_copy, [1024 x [1024 x float]]* %2, [1024 x [1024 x float]]* %res_copy)
  %3 = getelementptr inbounds [1024 x [1024 x float]], [1024 x [1024 x float]]* %avg_copy, i32 0, i32 0
  %4 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %cnt_copy, i32 0, i32 0
  %5 = getelementptr inbounds [1024 x [1024 x float]], [1024 x [1024 x float]]* %res_copy, i32 0, i32 0
  call void @apatb_time_img_hw([1024 x float]* %3, [1024 x i32]* %4, [1024 x float]* %5)
  call fastcc void @copy_out([1024 x [1024 x float]]* %0, [1024 x [1024 x float]]* %avg_copy, [1024 x [1024 x i32]]* %1, [1024 x [1024 x i32]]* %cnt_copy, [1024 x [1024 x float]]* %2, [1024 x [1024 x float]]* %res_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([1024 x [1024 x float]]* readonly, [1024 x [1024 x float]]* noalias, [1024 x [1024 x i32]]* readonly, [1024 x [1024 x i32]]* noalias, [1024 x [1024 x float]]* readonly, [1024 x [1024 x float]]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024a1024f32([1024 x [1024 x float]]* %1, [1024 x [1024 x float]]* %0)
  call fastcc void @onebyonecpy_hls.p0a1024a1024i32([1024 x [1024 x i32]]* %3, [1024 x [1024 x i32]]* %2)
  call fastcc void @onebyonecpy_hls.p0a1024a1024f32([1024 x [1024 x float]]* %5, [1024 x [1024 x float]]* %4)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1024a1024f32([1024 x [1024 x float]]* noalias, [1024 x [1024 x float]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1024 x [1024 x float]]* %0, null
  %3 = icmp eq [1024 x [1024 x float]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx12 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx311 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57.gep9 = getelementptr [1024 x [1024 x float]], [1024 x [1024 x float]]* %0, i64 0, i64 %for.loop.idx12, i64 %for.loop.idx311
  %5 = bitcast float* %dst.addr57.gep9 to i8*
  %src.addr68.gep10 = getelementptr [1024 x [1024 x float]], [1024 x [1024 x float]]* %1, i64 0, i64 %for.loop.idx12, i64 %for.loop.idx311
  %6 = bitcast float* %src.addr68.gep10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx311, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 1024
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx12, 1
  %exitcond13 = icmp ne i64 %for.loop.idx.next, 1024
  br i1 %exitcond13, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1024a1024i32([1024 x [1024 x i32]]* noalias, [1024 x [1024 x i32]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1024 x [1024 x i32]]* %0, null
  %3 = icmp eq [1024 x [1024 x i32]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx12 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx311 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57.gep9 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %0, i64 0, i64 %for.loop.idx12, i64 %for.loop.idx311
  %5 = bitcast i32* %dst.addr57.gep9 to i8*
  %src.addr68.gep10 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* %1, i64 0, i64 %for.loop.idx12, i64 %for.loop.idx311
  %6 = bitcast i32* %src.addr68.gep10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx311, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 1024
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx12, 1
  %exitcond13 = icmp ne i64 %for.loop.idx.next, 1024
  br i1 %exitcond13, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([1024 x [1024 x float]]*, [1024 x [1024 x float]]* noalias readonly, [1024 x [1024 x i32]]*, [1024 x [1024 x i32]]* noalias readonly, [1024 x [1024 x float]]*, [1024 x [1024 x float]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024a1024f32([1024 x [1024 x float]]* %0, [1024 x [1024 x float]]* %1)
  call fastcc void @onebyonecpy_hls.p0a1024a1024i32([1024 x [1024 x i32]]* %2, [1024 x [1024 x i32]]* %3)
  call fastcc void @onebyonecpy_hls.p0a1024a1024f32([1024 x [1024 x float]]* %4, [1024 x [1024 x float]]* %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_time_img_hw([1024 x float]*, [1024 x i32]*, [1024 x float]*)

define void @time_img_hw_stub_wrapper([1024 x float]*, [1024 x i32]*, [1024 x float]*) #5 {
entry:
  %3 = bitcast [1024 x float]* %0 to [1024 x [1024 x float]]*
  %4 = bitcast [1024 x i32]* %1 to [1024 x [1024 x i32]]*
  %5 = bitcast [1024 x float]* %2 to [1024 x [1024 x float]]*
  call void @copy_out([1024 x [1024 x float]]* null, [1024 x [1024 x float]]* %3, [1024 x [1024 x i32]]* null, [1024 x [1024 x i32]]* %4, [1024 x [1024 x float]]* null, [1024 x [1024 x float]]* %5)
  %6 = bitcast [1024 x [1024 x float]]* %3 to [1024 x float]*
  %7 = bitcast [1024 x [1024 x i32]]* %4 to [1024 x i32]*
  %8 = bitcast [1024 x [1024 x float]]* %5 to [1024 x float]*
  call void @time_img_hw_stub([1024 x float]* %6, [1024 x i32]* %7, [1024 x float]* %8)
  call void @copy_in([1024 x [1024 x float]]* null, [1024 x [1024 x float]]* %3, [1024 x [1024 x i32]]* null, [1024 x [1024 x i32]]* %4, [1024 x [1024 x float]]* null, [1024 x [1024 x float]]* %5)
  ret void
}

declare void @time_img_hw_stub([1024 x float]*, [1024 x i32]*, [1024 x float]*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
