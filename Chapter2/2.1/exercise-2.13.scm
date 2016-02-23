(cd "./")
(load "exercise-2.12.scm")

;; Let's attempt to find a formula for the approximate percentage tolerance of
;; the product of two intervals in terms of the tolerances of
;; the factors.

;; Suppose two intervals a and b.
;;
;; interval      center     tolerance
;; a             ca         ta
;; b             cb         tb
;;
;; Convert format of percentage tolerance to normal tolerance:
;; a = [ca*(1-0.5*ta), ca*(1+0.5*ta)]
;; b = [cb*(1-0.5*tb), cb*(1+0.5*tb)]
;;
;; According to the question, all numbers > 0.
;; Then apply mul-interval to compute a*b,
;; a*b = [ca*cb*(1 - 0.5*(ta+tb) + 0.25*ta*tb),
;;        ca*cb*(1 + 0.5*(ta+tb) + 0.25*ta*tb)]
;; Because ta and tb is small number, that means the term ta*tb is
;; much less. So, we can remove it from the formula a*b for
;; simplification. Namely the simplified format is
;; a*b = [ca*cb*(1 - 0.5*(ta+tb)),
;;        ca*cb*(1 + 0.5*(ta+tb))]
;;


;; Test
(define (mul-interval-center-percentage-precisely a b)
  (let ((ca (center a))
	(ta (percent a))
	(cb (center b))
	(tb (percent b)))
    (make-interval (* ca cb (+ (- 1 (* 0.5 (+ ta tb))) (* 0.25 ta tb)))
		   (* ca cb (+ 1 (* 0.5 (+ ta tb)) (* 0.25 ta tb))))))

(define (mul-interval-center-percentage-approximatively a b)
  (let ((ca (center a))
	(ta (percent a))
	(cb (center b))
	(tb (percent b)))
    (make-interval (* ca cb (- 1 (* 0.5 (+ ta tb))))
		   (* ca cb (+ 1 (* 0.5 (+ ta tb)))))))

(define a (make-center-percent 3.5 (/ 0.15 3.5)))
(define b (make-center-percent 3.5 (/ 0.15 3.5)))
(mul-interval-center-percentage-precisely a b)       ;Value 34: (11.730625000000002 . 12.780625)
(mul-interval-center-percentage-approximatively a b) ;Value 35: (11.725 . 12.775)
;; End
