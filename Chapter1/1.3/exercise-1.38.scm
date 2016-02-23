;; Euler's expression to approximate e
;; e - 2 = (approximate-e k), k -> infinite

(load "./exercise-1.37.scm")
(define (approximate-e k)
  (define (n i) 1)
  (define (d i)
    (cond ((= i 1) 1.0)
	  ((= i 2) 2.0)
	  ((or (= (remainder i 3) 0) (= (remainder i 3) 1)) 1.0)
	  (else (+ (d (- i 3)) 2.0))))
  (cont-frac n d k))

;; test
(+ 2 (approximate-e 10))  ;Value: 2.7182817182817183
(+ 2 (approximate-e 100)) ;Value: 2.7182818284590455
