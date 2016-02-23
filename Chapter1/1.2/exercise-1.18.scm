;; exploit the iterative algorithm
;; based on +, double, halve
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (fast-multi-iter a b)
  (define (multi-iter a counter product)
    (cond ((= counter 0) product)
	  ((even? counter) (multi-iter (double a) (halve counter) product))
	  (else (multi-iter a (- counter 1) (+ product a)))))
  (multi-iter a b 0))

(fast-multi-iter 2 0)
(fast-multi-iter 2 1)
(fast-multi-iter 2 2)
(fast-multi-iter 2 3)
(fast-multi-iter 2 4)
(fast-multi-iter 2 5)
(fast-multi-iter 100000000000 100000000000)
