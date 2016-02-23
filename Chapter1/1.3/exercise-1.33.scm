;; recurtive version
(define (filtered-accumulate-rec combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
	  (combiner (term a) (filtered-accumulate-rec combiner null-value term (next a) next b filter))
	  (filtered-accumulate-rec combiner null-value term (next a) next b filter))))


;; iterative version
(define (filtered-accumulate-iter combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
	null-value
	(if (filter a)
	    (combiner (term a) (combiner result (iter (next a) result)))
	    (combiner result (iter (next a) result)))))
  (iter a null-value))

;; a. compute by filtered-accumulate-rec
(load "../1.2/example-test-for-primality.scm")
(define (inc x) (+ x 1))
(define (exercise1.33-a a b)
  (filtered-accumulate-rec + 0 square a inc b prime?))
(exercise1.33-a 1 1)
(exercise1.33-a 1 2)
(exercise1.33-a 1 3)
(exercise1.33-a 1 4)
(exercise1.33-a 1 5)
(exercise1.33-a 1 10)
(trace exercise1.33-a)
(trace filtered-accumulate-rec)
(untrace)

;; b.
(load "../1.2/example-gcd.scm")
(define (exercise1.33-b n)
  (define (relatively-prime? a)
    (= (gcd a n) 1))
  (define (single x) x)
  (filtered-accumulate-iter * 1 single 1 inc n relatively-prime?))
(exercise1.33-b 1)
(exercise1.33-b 2)
(exercise1.33-b 3)
(exercise1.33-b 4)
(exercise1.33-b 5)
(exercise1.33-b 100)
(trace exercise1.33-b)
