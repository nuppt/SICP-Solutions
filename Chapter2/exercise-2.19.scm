(cd "./")
(load "example-list.scm")
(cd "../../Chapter1/1.2/")
(load "example-counting-change.scm")
(cd "../../Chapter2/2.1/")

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (no-more? l)
  (null? l))

(define (except-first-denomination l)
  (if (null? l)
      (error "cann't be empty list.")
      (cdr l)))
(define (first-denomination l)
  (car l))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount
		(except-first-denomination coin-values))
	    (cc (- amount
		   (first-denomination coin-values))
		coin-values)))))

(display "[Test begin]...")
(cc 100 us-coins) ;Value: 292
(cc 100 uk-coins) ;Value: 104561

;; no difference between positive-sequence and negative-sequence
;; Cause: process of cc is a whole searching process.
(cc 100 (reverse us-coins)) ;Value: 292
(cc 100 (reverse uk-coins)) ;Value: 104561
(display "[Test end]")
