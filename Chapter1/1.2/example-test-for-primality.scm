(define (smallest-divisor n) (find-divisor n 2))

;; enum from 2 to \sqrt(n)
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(smallest-divisor 1)
(smallest-divisor 2)
(smallest-divisor 3)
(smallest-divisor 4)
(smallest-divisor 9)
(smallest-divisor 53)

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 1)
(prime? 2)
(prime? 3)
(prime? 4)
(prime? 9)
(prime? 53)

;; base^exp % m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
	(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;; if n is prime while try-it n is prime (times)
;; else just try-it n is not prime once, then n isn't prime.
(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(fast-prime? 100000007 1)
