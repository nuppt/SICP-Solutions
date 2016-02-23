(cd "./")
(load "example-expt.scm")
(define (exer-1.25:expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (exer-1.25:fermat-test n)
  (define (try-it a)
    (= (exer-1.25:expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (exer-1.25:fast-prime? n times)
  (cond ((= times 0) true)
	((exer-1.25:fermat-test n) (exer-1.25:fast-prime? n (- times 1)))
	(else false)))

;; Theoretically, fermat-test function is true. But when scale of n
;; becomes larger, expmod function dependent by fermat-test cann't
;; give a result.
;; In breif, exer-1.25:fast-prime? is different with fast-prime? in
;; execution efficiency.
(exer-1.25:fast-prime? 100007 1)
