;; Test that the binary encoding of the dump matches that of the original
;; RUN: sexpr_dump %s > %t1
;; RUN: sexpr-wasm -d %t1 > %t2
;; RUN: sexpr-wasm -d %s | diff - %t2
;; Test that round-tripping is stable
;; RUN: sexpr_dump %t1 | diff %t1 -
(module
  (func (param i32) (param $n f32)
    (local i32 i64)
    (local $m f64)
    (get_local 0)
    (get_local 1)
    (get_local $n) ;; 1
    (get_local 2)
    (get_local 3)
    (get_local $m) ;; 4
    (get_local 4)))
