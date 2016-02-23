(define (fast-expt-iter b n)
  (define (f-e-i b counter a)
    (cond ((= counter 0) a)
	  ((even? counter) (f-e-i (* b b) (/ counter 2) a))
	  (else (* b (f-e-i b (- counter 1) a)))))
  (f-e-i b n 1))

(fast-expt-iter 2 10)
(fast-expt-iter 3 10)
