;; RUN: wat -S %s | FileCheck %s
(module
  (func
    (local i32) (local i32)
    (local i64) (local i64)
    (local f32) (local f32)
    (local f64) (local f64)
    (i32.eq (get_local 0) (get_local 1))
;; CHECK: icmp eq i32 %get_local, %get_local8
    (i64.eq (get_local 2) (get_local 3))
;; CHECK: icmp eq i64 %get_local9, %get_local10
    (f32.eq (get_local 4) (get_local 5))
;; CHECK: fcmp oeq float %get_local12, %get_local13
    (f64.eq (get_local 6) (get_local 7))
;; CHECK: fcmp oeq double %get_local15, %get_local16
    (i32.ne (get_local 0) (get_local 1))
;; CHECK: icmp ne i32 %get_local18, %get_local19
    (i64.ne (get_local 2) (get_local 3))
;; CHECK: icmp ne i64
    (f32.ne (get_local 4) (get_local 5))
;; CHECK: fcmp une float
    (f64.ne (get_local 6) (get_local 7))
;; CHECK: fcmp une double
    (i32.lt_s (get_local 0) (get_local 1))
;; CHECK: icmp slt i32
    (i64.lt_s (get_local 2) (get_local 3))
;; CHECK: icmp slt i64
    (i32.lt_u (get_local 0) (get_local 1))
;; CHECK: icmp ult i32
    (i64.lt_u (get_local 2) (get_local 3))
;; CHECK: icmp ult i64
    (f32.lt (get_local 4) (get_local 5))
;; CHECK: fcmp olt float
    (f64.lt (get_local 6) (get_local 7))
;; CHECK: fcmp olt double
    (i32.le_s (get_local 0) (get_local 1))
;; CHECK: icmp sle i32
    (i64.le_s (get_local 2) (get_local 3))
;; CHECK: icmp sle i64
    (i32.le_u (get_local 0) (get_local 1))
;; CHECK: icmp ule i32
    (i64.le_u (get_local 2) (get_local 3))
;; CHECK: icmp ule i64
    (f32.le (get_local 4) (get_local 5))
;; CHECK: fcmp ole float
    (f64.le (get_local 6) (get_local 7))
;; CHECK: fcmp ole double
    (i32.gt_s (get_local 0) (get_local 1))
;; CHECK: icmp sgt i32
    (i64.gt_s (get_local 2) (get_local 3))
;; CHECK: icmp sgt i64
    (i32.gt_u (get_local 0) (get_local 1))
;; CHECK: icmp ugt i32
    (i64.gt_u (get_local 2) (get_local 3))
;; CHECK: icmp ugt i64
    (f32.gt (get_local 4) (get_local 5))
;; CHECK: fcmp ogt float
    (f64.gt (get_local 6) (get_local 7))
;; CHECK: fcmp ogt double
    (i32.ge_s (get_local 0) (get_local 1))
;; CHECK: icmp sge i32
    (i64.ge_s (get_local 2) (get_local 3))
;; CHECK: icmp sge i64
    (i32.ge_u (get_local 0) (get_local 1))
;; CHECK: icmp uge i32
    (i64.ge_u (get_local 2) (get_local 3))
;; CHECK: icmp uge i64
    (f32.ge (get_local 4) (get_local 5))
;; CHECK: fcmp oge float
    (f64.ge (get_local 6) (get_local 7)))
;; CHECK: fcmp oge double
 (func (result i32) (return (i32.eq (i32.const 0) (i32.const 1))))
;; CHECK: ret i32 0
 (func (param i32) (param i32) (result i32)
   (i32.eq (get_local 0) (get_local 1)))
;; CHECK: zext
;; CHECK: ret i32
)