;; Cases of (mul-interval x y) = 3 * 3
;; for interval x, there are 3 kinds of situations:
;;   1. {x | (lower-bound x) < 0 and (upper-bound x) < 0}
;;   2. {x | (lower-bound x) > 0 and (upper-bound x) > 0}
;;   3. {x | (lower-bound x) < 0 and (upper-bound x) > 0} (x spans 0)
;;
;; same to interval y, there are also 3 kinds of situations.

(cd "./")
(load "exercise-2.10.scm")

;; test the signs of the endpoints of the intervals
;; @Return Value
;;    +1 if both endpoints are non-negative
;;    -1 if both endpoints are negative
;;     0 if interval spans zero
(define (get-endpoint-sign x)
  (cond ((and (>= (lower-bound x) 0)
	      (>= (upper-bound x) 0)) 1)
	((and (< (lower-bound x) 0)
	      (< (upper-bound x) 0)) -1)
	(else 0)))

;; Rewrite mul-interval to compute it by unfolding all kinds of situations
(define (mul-interval-new x y)
  (let ((x-es (get-endpoint-sign x))
	(y-es (get-endpoint-sign y))
	(x-lo (lower-bound x))
	(x-up (upper-bound x))
	(y-lo (lower-bound y))
	(y-up (upper-bound y)))
    (cond ((= x-es 1)
	   (cond ((= y-es 1) (make-interval (* x-lo y-lo) (* x-up y-up)))
		 ((= y-es -1) (make-interval (* x-up y-lo) (* x-lo y-up)))
		 (else (make-interval (* x-up y-lo) (* x-up y-up)))))
	  ((= x-es -1)
	   (cond ((= y-es 1) (make-interval (* x-lo y-up) (* x-up y-lo)))
		 ((= y-es -1) (make-interval (* x-up y-up) (* x-lo y-lo)))
		 (else (make-interval (* x-lo y-up) (* x-lo y-lo)))))
	  (else
	   (cond ((= y-es 1) (make-interval (* x-lo y-up) (* x-up y-up)))
		 ((= y-es -1) (make-interval (* x-up y-lo) (* x-lo y-lo)))
		 (else (make-interval (min (* x-lo y-up) (* x-up y-lo))
				      (max (* x-lo y-lo) (* x-up y-up)))))))))



;; The following code for test is refered from http://community.schemewiki.org/?sicp-ex-2.11
(define (eql-interval? a b)
  (and (= (upper-bound a) (upper-bound b))
       (= (lower-bound a) (lower-bound b))))

;; Fails if the new mult doesn't return the same answer as the old
;; naive mult.
(define (ensure-mult-works aH aL bH bL)
  (let ((a (make-interval aL aH))
	(b (make-interval bL bH)))
    (if (eql-interval? (mul-interval a b)
		       (mul-interval-new a b))
	true
	(error "new mult returns different value!"
	       a
	       b
	       (mul-interval a b)
	       (mul-interval-new a b)))))


(ensure-mult-works  +10 +10   +10 +10)
(ensure-mult-works  +10 +10   +00 +10)
(ensure-mult-works  +10 +10   +00 +00)
(ensure-mult-works  +10 +10   +10 -10)
(ensure-mult-works  +10 +10   -10 +00)
(ensure-mult-works  +10 +10   -10 -10)

(ensure-mult-works  +00 +10   +10 +10)
(ensure-mult-works  +00 +10   +00 +10)
(ensure-mult-works  +00 +10   +00 +00)
(ensure-mult-works  +00 +10   +10 -10)
(ensure-mult-works  +00 +10   -10 +00)
(ensure-mult-works  +00 +10   -10 -10)

(ensure-mult-works  +00 +00   +10 +10)
(ensure-mult-works  +00 +00   +00 +10)
(ensure-mult-works  +00 +00   +00 +00)
(ensure-mult-works  +00 +00   +10 -10)
(ensure-mult-works  +00 +00   -10 +00)
(ensure-mult-works  +00 +00   -10 -10)

(ensure-mult-works  +10 -10   +10 +10)
(ensure-mult-works  +10 -10   +00 +10)
(ensure-mult-works  +10 -10   +00 +00)
(ensure-mult-works  +10 -10   +10 -10)
(ensure-mult-works  +10 -10   -10 +00)
(ensure-mult-works  +10 -10   -10 -10)

(ensure-mult-works  -10 +00   +10 +10)
(ensure-mult-works  -10 +00   +00 +10)
(ensure-mult-works  -10 +00   +00 +00)
(ensure-mult-works  -10 +00   +10 -10)
(ensure-mult-works  -10 +00   -10 +00)
(ensure-mult-works  -10 +00   -10 -10)

(ensure-mult-works  -10 -10   +10 +10)
(ensure-mult-works  -10 -10   +00 +10)
(ensure-mult-works  -10 -10   +00 +00)
(ensure-mult-works  -10 -10   +10 -10)
(ensure-mult-works  -10 -10   -10 +00)
(ensure-mult-works  -10 -10   -10 -10)
