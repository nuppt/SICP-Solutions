;; Template
;;(define (<name> a b)
;;  (if (> a b)
;;      0
;;      (+ (<term> a)
;;	 (<name> (<next> a) b))))

(define (cube x) (* x x x))

;; a + (a + 1) + ... + (b - 1) + b
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 10)  ; 55

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(sum-cubes 1 10)  ; 3025

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
	 (pi-sum (+ a 4) b))))
(*(pi-sum 1 10) 8)
(*(pi-sum 1 100) 8)
(*(pi-sum 1 1000) 8)
(*(pi-sum 1 10000) 8)
(*(pi-sum 1 100000) 8) ;;  ;Aborting!: maximum recursion depth exceeded

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))
(define (inc n) (+ n 1))
(define (sum-cubes-highOrder a b)
  (sum cube a inc b))
(sum-cubes-highOrder 1 1000)

(define (identity x) x)
(define (sum-integers-highOrder a b)
  (sum identity a inc b))
(sum-integers-highOrder 1 10000)

(define (pi-sum a b)
  (define (pi-term x) (/ 1.0 (* x (+ x 2))))
  (define (pi-next x) (+ x 4))
  (sum pi-term a pi-next b))

(* (pi-sum 1 10) 8)
(* (pi-sum 1 100) 8)
(* (pi-sum 1 1000) 8)
(* (pi-sum 1 10000) 8)
(* (pi-sum 1 100000) 8)


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

;; integral(x^3, [0..1]) = (1^4)/4 - (0^4)/4 = 0.25
(integral cube 0 1 0.1)    ;Value: .24874999999999994
(integral cube 0 1 0.01)   ;Value: .24998750000000042
(integral cube 0 1 0.001)  ;Value: .249999875000001
(integral cube 0 1 0.0001) ;Value: .24999999874993412
