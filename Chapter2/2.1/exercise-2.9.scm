(cd "./")
(load "exercise-2.8.scm")

(define (width-interval x)
  (/ (- (lower-bound x) (upper-bound x)) 2.0))

;; Test
(display "[Test begin]")
;; Show difference between four interval arithmetic in usage
;; of width-interval

;; width of the sum/difference of two intervals is a function
;; only of the widths of the intervals being added/subtracted.
(define x (make-interval 5 10))
(define y (make-interval 1 4))
(= (width-interval (add-interval x y))
   (+ (width-interval x) (width-interval y))) ;Value: #t
(= (width-interval (sub-interval x y))
   (- (width-interval x) (width-interval y))) ;Value: #t
(= (width-interval (mul-interval x y))
   (* (width-interval x) (width-interval y))) ;Value: #f
(= (width-interval (div-interval x y))
   (/ (width-interval x) (width-interval y))) ;Value: #f
;; Let me consider it on paper:
;; Way 1:
;;   [5,10] / [1,4] = [5,10] * [1/4,1] = [5/4, 10]
;;   So, the width of [5/4,10] = (5/4 + 10) / 2 = 45/8
;; Way 2:
;;   (5+10)/2 + (1+4)/2 = 20/2 = 10
;; Obviously, the result computed by Way1 and Way2 are different.
(display "[Test End]")
