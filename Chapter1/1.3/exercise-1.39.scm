(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
	(- x)
	(- (square x))))
  (define (d i)
    (if (= i 1)
	(- 1)
	(- (d (- i 1)) 2)))
  (cont-frac n d k))

(tan-cf 0 10)          ;Value: 0
(tan-cf 0.0000001 10)  ;Value: 1.0000000000000033e-7
(tan-cf 1.0 10)        ;Value: 1.557407724654902
(tan-cf 3.1415926 10)  ;Value: -5.548300656344823e-8
