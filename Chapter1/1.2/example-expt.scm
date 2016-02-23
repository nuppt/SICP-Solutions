;; b^n = b * (b^n-1),
;; b^0 = 1.
(define (expt-rec b n)
  (if (= n 0)
      1
      (* b (expt-rec b (- n 1)))))
(expt-rec 2 10)
(expt-rec 3 10)
(expt-rec 10 10)

(define (expt b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
	product
	(expt-iter b (- counter 1) (* b product))))
  (expt-iter b n 1))

(expt 2 10)
(expt 3 10)
(expt 10 10)


(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (* (fast-expt b (/ n 2)) (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (/ (- n 1) 2)) (fast-expt b (/ (- n 1) 2))))))
(define (even? n)
  (= (remainder n 2) 0))
(fast-expt 2 10)
(fast-expt 3 10)
(fast-expt 10 10)
