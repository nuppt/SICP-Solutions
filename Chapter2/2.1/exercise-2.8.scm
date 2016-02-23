(cd "./")
(load "exercise-2.7.scm")

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
		 (- (upper-bound x) (upper-bound y))))


;; Test
(display "[Test Begin]")
(define x (make-interval 5 10))
(define y (make-interval 1 4))
(display-interval "x-y" (sub-interval x y))
(display "[Test End]")
;; End
