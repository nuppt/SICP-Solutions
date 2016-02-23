(define nil '())

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree)) (if (odd? tree)
				(square tree)
				0))
	(else (+ (sum-odd-squares (car tree))
		 (sum-odd-squares (cdr tree))))))

;; Test
(sum-odd-squares (list (list 1 2 3)
		       (list (list 4 5)
			     (list 6 7 8 9))))  ;Value: 165 = 1^2 + 3^2 + 5^2 + 7^2 + 9^2
;; End



(load "../../Chapter1/1.2/example-fib.scm")
(define (even-fibs n)
  (define (next k)
    (if (> k n)
	nil
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))
(define (odd-fibs n)
  (define (next k)
    (if (> k n)
	nil
	(let ((f (fib k)))
	  (if (odd? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))
;; Test
(even-fibs 10)  ;Value 23: (0 2 8 34)
(odd-fibs 10)   ;Value 24: (1 1 3 5 13 21 55)
;; End


;; Abstraction of examples above
;; 1. enumerate a set
;; 2. filter/map the set (to get a new set)
;; 3. map/filter the set (to get a new set)
;; 4. accumulate an operator on that set


;; define filter on a sequence satisfy a predicate
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))
(filter odd? (list 1 2 3 4 5))  ;Value 19: (1 3 5)

;; define accumulations on a sequence on a op(operator) with a initial value
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;;Value: 15 = (+ 1 (+ 2 (+ 3 (+ 4 (+ 5 0)))))
(accumulate + 0 (list 1 2 3 4 5))
;;Value: 120 = (* 1 (* 2 (* 3 (* 4 (* 5 1)))))
(accumulate * 1 (list 1 2 3 4 5))
;;Value 20: (1 2 3 4 5) = (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 nil)))))
(accumulate cons nil (list 1 2 3 4 5))

;; define enumerate procedure in an interval to generate a sequence
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)  ;Value 21: (2 3 4 5 6 7)

;; define enumerate procedure in a tree to generate a tree
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1
		      (list 2
			    (list 3 4))
		      5))  ;Value 22: (1 2 3 4 5)


;; reformulate sum-odd-squares and even-fibs as in the signal-flow diagrams
(define (signal-flow-sum-odd-squares tree)
  (accumulate +
	      0
	      (map square
		   (filter odd?
			   (enumerate-tree tree)))))
(signal-flow-sum-odd-squares (list (list 1 2 3)
				   (list (list 4 5)
					 (list 6 7 8 9))))  ;Value: 165

(define (signal-flow-even-fibs n)
  (accumulate cons
	      nil
	      (filter even?
		      (map fib
			   (enumerate-interval 0 n)))))
(signal-flow-even-fibs 10)  ;Value 25: (0 2 8 34)

(define (list-fib-squares n)
  (accumulate cons
	      nil
	      (map square
		   (map fib
			(enumerate-interval 0 n)))))
(list-fib-squares 10)  ;Value 26: (0 1 1 4 9 25 64 169 441 1156 3025)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
	      1
	      (map square
		   (filter odd?
			   sequence))))
(product-of-squares-of-odd-elements (list 1 2 3 4 5)) ;Value: 225 = 1^2 * 3^2 * 5^2
