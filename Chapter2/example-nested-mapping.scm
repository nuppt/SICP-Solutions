(load "example-sequences-as-conventional-interfaces.scm")
(load "../../Chapter1/1.2/example-test-for-primality.scm")
(define n 4)

;Value 14: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))
(accumulate append
	    nil
	    (map (lambda (i)
		   (map (lambda (j) (list i j))
			(enumerate-interval 1 (- i 1))))
		 (enumerate-interval 1 n)))


(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (flatmap (lambda (i)
			  (map (lambda (j) (list i j))
			       (enumerate-interval 1 (- i 1))))
			(enumerate-interval 1 n)))))
;; Test
;Value 18: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))
(prime-sum-pairs 6)
;; End


;; compute the permutations of a set
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutations (remove x s))))
	       s)))

;; delete a given element in sequence
(define (remove item seq)
  (filter (lambda (x) (not (= x item)))
	  seq))

;; Test
(permutations (list 1 2 3))  ;Value 19: ((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1))
;; End
