;; calculate fibonacci number in a fast way
;; This algorithm may need readers a little acknowledge about linear algebra to understand deeply.
;; take it easy, if don't learn any linear algebra, it just has a intuitionistic idea:
;; Before, we are use a general iterative process to calculate fib(n).
;; Now, we see the iterative process as a series of transformations, which keep invarient.
;; We force on transformations named T, each transformation in previous process are same:
;; T:
;;   a <- a + b
;;   b <- a
;; In linear algebra, T can be a transfromational matrix:
;; T = [<1 1>
;;      <0 1>]
;; each iterative process can be expressed as
;; [a' b'] = T [a b]  (note: [] means raw, <> means col)
;;
;; At first, [a b] = [1 0]
;; After (n-1)-iterative process, [a b] = [fib(n) fib(n-1)]
;; we can describe this process by matrix T as follows:
;; [fib(n) fib(n-1)] = T ( T ... ( T[1 0]))
;;                     \____n-1____/
;; so, the problem becomes calculating the exponentiaton of T

(define (fib n)
  (define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (* p p) (* q q))
		   (+ (* 2 p q) (* q q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))
  (fib-iter 1 0 0 1 n))


(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 10)
(fib 1000)
