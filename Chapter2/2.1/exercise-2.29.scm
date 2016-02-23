(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;; a. selectors
(define (left-branch m) (car m))
(define (right-branch m) (car (cdr m)))
(define (branch-length b) (car b))
(define (branch-structure b) (car (cdr b)))


;; b. total-weight
(define (total-weight m)
  (cond ((null? m) 0)
	((not (pair? m)) m)
	(else (+ (total-weight (branch-structure (left-branch m)))
		 (total-weight (branch-structure (right-branch m)))))))
;; Test
(define x (list (list 1 2) (list 3 4)))
(total-weight x)
;; End

;; c. test balance of binary mobile
(define (test-balance-of-binary-mobile m)
  (cond ((null? m) true)
	((not (pair? m)) true)
	(else (if (not (= (* (branch-length (left-branch m)) (total-weight (branch-structure (left-branch m))))
			  (* (branch-length (right-branch m)) (total-weight (branch-structure (right-branch m))))))
		  false
		  (and (test-balance-of-binary-mobile (branch-structure (left-branch m)))
		       (test-balance-of-binary-mobile (branch-structure (right-branch m))))))))

;; Test
(test-balance-of-binary-mobile x) ;Value: #f
(define b1 (make-branch 2 2))
(define b2 (make-branch 2 2))
(define m1 (make-mobile b1 b2))
(define m2 (make-mobile b1 b2))
(test-balance-of-binary-mobile m1) ;Value: #t

(define b3 (make-branch 5 m1))
(define b4 (make-branch 5 m2))
(define m3 (make-mobile b3 b4))
(test-balance-of-binary-mobile m3) ;Value: #t

(define b5 (make-branch 4 m2))
(define m4 (make-mobile b3 b5))
(test-balance-of-binary-mobile m4) ;Value: #f
;; End


;; d. change the representation of mobiles
(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
  (cons length structure))
;; *** only need to change the definition of selectors *** ;;
(define (left-branch m) (car m))
(define (right-branch m) (cdr m))
(define (branch-length b) (car b))
(define (branch-structure b) (cdr b))
;; Test
(define x (cons (cons 1 2) (cons 3 4)))
(total-weight x)
(test-balance-of-binary-mobile x) ;Value: #f
(define b1 (make-branch 2 2))
(define b2 (make-branch 2 2))
(define m1 (make-mobile b1 b2))
(define m2 (make-mobile b1 b2))
(test-balance-of-binary-mobile m1) ;Value: #t

(define b3 (make-branch 5 m1))
(define b4 (make-branch 5 m2))
(define m3 (make-mobile b3 b4))
(test-balance-of-binary-mobile m3) ;Value: #t

(define b5 (make-branch 4 m2))
(define m4 (make-mobile b3 b5))
(test-balance-of-binary-mobile m4) ;Value: #f
;; End
