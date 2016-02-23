;; Simpson's Rule
;; a more accurate method of numerical integration

(define (cube x) (* x x x))

(define (h a b n) (/ (- b a) n))

(define (yk f a b n k) (f (+ a (* k (h a b n)))))

(define (sum-yk f a b start n)
  (cond ((= start 0) (yk f a b n start))
	((< start n) (if (odd? start)
			 (+ (sum-yk f a b (- start 1) n) (* 4 (yk f a b n start)))
			 (+ (sum-yk f a b (- start 1) n) (* 2 (yk f a b n start)))))
	((= start n) (+ (sum-yk f a b (- start 1) n) (yk f a b n start)))))

(define (integral-simpson-rule f a b n)
  (define (h-div-3) (/ (h a b n) 3.0))
  (* 1.0 (h-div-3) (sum-yk f a b n n)))


;; integral(x^3, [0..1]) = (1^4)/4 - (0^4)/4 = 0.25
;;(integral cube 0 1 0.1)    ;Value: .24874999999999994
;;(integral cube 0 1 0.01)   ;Value: .24998750000000042
;;(integral cube 0 1 0.001)  ;Value: .249999875000001
;;(integral cube 0 1 0.0001) ;Value: .24999999874993412
(integral-simpson-rule cube 0 1 5)      ;Value: .2032
(integral-simpson-rule cube 0 1 10)     ;Value: .25
(integral-simpson-rule cube 0 1 100)    ;Value: .25
(integral-simpson-rule cube 0 1 10000)  ;Value: .25
