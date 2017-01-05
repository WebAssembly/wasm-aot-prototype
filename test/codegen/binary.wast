;; RUN: wat -S %s | FileCheck %s
(module
  (func
    (local i32) (local i32)
    (local i64) (local i64)
    (local f32) (local f32)
    (local f64) (local f64)
    (drop (i32.add (get_local 0) (get_local 1)))
;; CHECK: add i32 %get_local, %get_local8
    (drop (i64.add (get_local 2) (get_local 3)))
;; CHECK: add i64 %get_local9, %get_local10
    (drop (f32.add (get_local 4) (get_local 5)))
;; CHECK: fadd float %get_local11, %get_local12
    (drop (f64.add (get_local 6) (get_local 7)))
;; CHECK: fadd double %get_local13, %get_local14
    (drop (i32.sub (get_local 0) (get_local 1)))
;; CHECK: sub i32
    (drop (i64.sub (get_local 2) (get_local 3)))
;; CHECK: sub i64
    (drop (f32.sub (get_local 4) (get_local 5)))
;; CHECK: fsub float
    (drop (f64.sub (get_local 6) (get_local 7)))
;; CHECK: fsub double
    (drop (i32.mul (get_local 0) (get_local 1)))
;; CHECK: mul i32
    (drop (i64.mul (get_local 2) (get_local 3)))
;; CHECK: mul i64
    (drop (f32.mul (get_local 4) (get_local 5)))
;; CHECK: fmul float
    (drop (f64.mul (get_local 6) (get_local 7)))
;; CHECK: fmul double
    (drop (i32.div_s (get_local 0) (get_local 1)))
;; CHECK: sdiv i32
    (drop (i64.div_s (get_local 2) (get_local 3)))
;; CHECK: sdiv i64
    (drop (i32.div_u (get_local 0) (get_local 1)))
;; CHECK: udiv i32
    (drop (i64.div_u (get_local 2) (get_local 3)))
;; CHECK: udiv i64
    (drop (f32.div (get_local 4) (get_local 5)))
;; CHECK: fdiv float
    (drop (f64.div (get_local 6) (get_local 7)))
;; CHECK: fdiv double
    (drop (i32.rem_s (get_local 0) (get_local 1)))
;; CHECK: srem i32
    (drop (i64.rem_s (get_local 2) (get_local 3)))
;; CHECK: srem i64
    (drop (i32.rem_u (get_local 0) (get_local 1)))
;; CHECK: urem i32
    (drop (i64.rem_u (get_local 2) (get_local 3)))
;; CHECK: urem i64
    (drop (f32.min (get_local 4) (get_local 5)))
;; CHECK: call float @__wasm_float_min_f32(float %get_local{{.*}}, float %get_local{{.*}})
    (drop (f64.min (get_local 6) (get_local 7)))
;; CHECK: call double @__wasm_float_min_f64(double %get_local{{.*}}, double %get_local{{.*}})
    (drop (f32.max (get_local 4) (get_local 5)))
;; CHECK: call float @__wasm_float_max_f32(float %get_local{{.*}}, float %get_local{{.*}})
    (drop (f64.max (get_local 6) (get_local 7)))
;; CHECK: call double @__wasm_float_max_f64(double %get_local{{.*}}, double %get_local{{.*}})
    (drop (i32.and (get_local 0) (get_local 1)))
;; CHECK: and i32
    (drop (i64.and (get_local 2) (get_local 3)))
;; CHECK: and i64
    (drop (i32.or (get_local 0) (get_local 1)))
;; CHECK: or i32
    (drop (i64.or (get_local 2) (get_local 3)))
;; CHECK: or i64
    (drop (i32.xor (get_local 0) (get_local 1)))
;; CHECK: xor i32
    (drop (i64.xor (get_local 2) (get_local 3)))
;; CHECK: xor i64
    (drop (i32.shl (get_local 0) (get_local 1)))
;; CHECK: %shamt_check = icmp uge i32 %get_local{{.*}}, 32
;; CHECK: %shift_result = shl i32 %get_local{{.*}}, %get_local
;; CHECK: select i1 %shamt_check, i32 0, i32 %shift_result
    (drop (i64.shl (get_local 2) (get_local 3)))
;; CHECK: %shamt_check{{.*}} = icmp uge i64 %get_local{{.*}}, 64
;; CHECK: %shift_result{{.*}} = shl i64 %get_local{{.*}}, %get_local
;; CHECK: select i1 %shamt_check{{.*}}, i64 0, i64 %shift_result
    (drop (i32.shr_u (get_local 0) (get_local 1)))
;; CHECK: %shamt_check{{.*}} = icmp uge i32 %get_local{{.*}}, 32
;; CHECK: %shift_result{{.*}} = lshr i32 %get_local{{.*}}, %get_local
;; CHECK: select i1 %shamt_check{{.*}}, i32 0, i32 %shift_result
    (drop (i64.shr_u (get_local 2) (get_local 3)))
;; CHECK: %shamt_check{{.*}} = icmp uge i64 %get_local{{.*}}, 64
;; CHECK: %shift_result{{.*}} = lshr i64 %get_local{{.*}}, %get_local
;; CHECK: select i1 %shamt_check{{.*}}, i64 0, i64 %shift_result
    (drop (i32.shr_s (get_local 0) (get_local 1)))
;; CHECK: %shamt_check{{.*}} = icmp uge i32 %get_local{{.*}}, 32
;; CHECK: %shamt = select i1 %shamt_check{{.*}}, i32 31, i32 %get_local
;; CHECK: %shift_expr{{.*}} = ashr i32 %get_local{{.*}}, %shamt
    (drop (i64.shr_s (get_local 2) (get_local 3)))
;; CHECK: %shamt_check{{.*}} = icmp uge i64 %get_local{{.*}}, 64
;; CHECK: %shamt{{.*}} = select i1 %shamt_check{{.*}}, i64 63, i64 %get_local
;; CHECK: %shift_expr{{.*}} = ashr i64 %get_local{{.*}}, %shamt
    (drop (f32.copysign (get_local 4) (get_local 5)))
;; CHECK: call float @llvm.copysign.f32(float %get_local{{.*}}, float %get_local{{.*}})
    (drop (f64.copysign (get_local 6) (get_local 7))))
;; CHECK: call double @llvm.copysign.f64(double %get_local{{.*}}, double %get_local{{.*}})
)
