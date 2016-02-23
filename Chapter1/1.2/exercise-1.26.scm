;; (* (exer-1.26:expmod ...) (exer-1.26:expmod ...)) will calculate
;; (exer-1.26:expmod ...) twice in each recursion.
;; but (exer-1.26:expmod ...) will only be calculated once in
;; (square (exer-1.26:expmod ...))
(define (exer-1.26:expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) (remainder (* (exer-1.26:expmod base (/ exp 2) m)
				   (exer-1.26:expmod base (/ exp 2) m)) m))
	(else (remainder (* base (exer-1.26:expmod base (- exp 1) m)) m))))

(define (exer-1.26:fermat-test n)
  (define (try-it a)
    (= (exer-1.26:expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;; if n is prime while try-it n is prime (times)
;; else just try-it n is not prime once, then n isn't prime.
(define (exer-1.26:fast-prime? n times)
  (cond ((= times 0) true)
	((exer-1.26:fermat-test n) (exer-1.26:fast-prime? n (- times 1)))
	(else false)))

;; how to calculate execution time of a function
(define (exec-time-of-exer-1.26:fast-prime? start-time)
  (exer-1.26:fast-prime? 100007 1)
  (- (real-time-clock) start-time))

(exec-time-of-exer-1.26:fast-prime? (real-time-clock))
