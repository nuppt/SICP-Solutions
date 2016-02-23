(cd "./")
(load "exercise-2.9.scm")

(define (print . args)
  (display args))

;; Test
(define x (make-interval 2 8))
(define y (make-interval 4 1))

(display-interval "x" x)
(display-interval "y" y)
(display-interval "x+y" (add-interval x y))
(display-interval "x-y" (sub-interval x y))
(display-interval "x*y" (mul-interval x y))
(display-interval "x/y" (div-interval x y))


;; new definition: division by interval spanning 0 should fail.
(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "Division error (interval spans zero)" y)
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))

(define z (make-interval -1 1))
(display-interval "x/y" (div-interval x y))

;; This would trigger the error branch in div-interval, so I
;; comment the following code.
;; (display-interval "x/z" (div-interval x z))
