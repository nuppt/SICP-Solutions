(cd "./")
(load "exercise-2.11.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


(define (make-center-percent c p)
  (make-center-width c (* c p)))
(define (percent i)
  (/ (width i) (center i)))


;; Test
(display "[Test begin]")
(display-interval "interval" (make-center-width 3.5 0.15))
(center (make-center-width 3.5 0.15))
(width (make-center-width 3.5 0.15))
(make-center-percent 3.5 (/ 0.15 3.5))
(percent (make-center-percent 3.5 (/ 0.15 3.5))) ;Value: .04285714285714286
(display "[Test end]")
