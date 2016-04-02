(load "example-sequences-as-conventional-interfaces.scm")
(load "exercise-2.26.scm")

;; 1. dot-product
(define (dot-product v w)
  (accumulate + 0 (map * v w)))  ;; map is a override function, the number of arguments depends on the first argument of map, which is an operator on each elements of list.

(display "Test dot-product")
(define vec1 (list 1 2 3))
(define vec2 (list 4 5 6))
(dot-product vec1 vec2)  ;Value: 32 = 1*4 + 2*5 + 3*6
(display "Test End")


;; 2. matrix-*-vector
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(display "Test matrix-*-vector")
(define mat1 (list (list 1 2 3)
		   (list 1 2 3)))
(matrix-*-vector mat1 vec1)  ;Value 14: (14 14)
(matrix-*-vector mat1 vec2)  ;Value 15: (32 32)
(display "Test End")


;; 3. transpose
(define (transpose mat)
  (accumulate-n cons nil mat))
(display "Test transpose")
(load "../../lib.scm")
(print "Before transpose:" mat1)
(print "After transpose:" (transpose mat1))
(display "Test End")


;; 4. matrix-*-matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))
(display "Test matrix-*-matrix")
;; [[1 2 3]
;;  [1 2 3]]
;; *
;; [[1 1]
;;  [2 2]
;;  [3 3]]
;; =
;; [[1*1 + 2*2 + 3*3   1*1 + 2*2 + 3*3]
;;  [1*1 + 2*2 + 3*3   1*1 + 2*2 + 3*3]]
(matrix-*-matrix mat1 (transpose mat1))
(display "Test End")
