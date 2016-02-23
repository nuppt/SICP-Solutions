;; Recursive version of sum function
;; (define (sum term a next b)
;;  (if (> a b)
;;      0
;;      (+ (term a)
;;	   (sum term (next a) next b))))


;; Iterative version of sum function
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result  ; carefully, here cann't be writen as (result)
	(iter (next a) (+ (term a) result))))
  (iter a 0))

(define (integral-iter f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum-iter f (+ a (/ dx 2.0)) add-dx b) dx))

(integral-iter cube 0 1 0.1)    ;Value: .24874999999999992
(integral-iter cube 0 1 0.01)   ;Value: .24998750000000042
(integral-iter cube 0 1 0.001)  ;Value: .24999987500000073
(integral-iter cube 0 1 0.0001) ;Value: .24999999874993337
