;;
;; implement a representation for rectangles in a plane
;;
;; For simplification, suppose all rectangles have sides parallel to the major axes of the plane.

;; Point type
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

;; Define type of rectangle
;; constructor: give me two points, I will return a rectangle for you.
(define (make-rect bottom-left top-right)
  (cons bottom-left top-right))
;; selectors
(define (bottom-left rect)
  (car rect))
(define (bottom-right rect)
  (make-point (x-point (cdr rect))
	      (y-point (car rect))))
(define (top-left rect)
  (make-point (x-point (car rect))
	      (y-point (cdr rect))))
(define (top-right rect)
  (cdr rect))

(define (width-rect rect)
  (abs (- (x-point (bottom-left rect))
	  (x-point (bottom-right rect)))))
(define (height-rect rect)
  (abs (- (y-point (bottom-left rect))
	  (y-point (top-left rect)))))

;; Public methods
(define (perimeter-rect rect)
  (* 2 (+ (width-rect rect) (height-rect rect))))
(define (area-rect rect)
  (* (width-rect rect) (height-rect rect)))

;; Test
;; define a global object r to represent a rectangle
(define r (make-rect (make-point 1 1)
		     (make-point 5 9)))
(perimeter-rect r) ;Value: 24
(area-rect r)      ;Value: 32
;; End



;; Alternate implementation of rectangle
(define (make-rect-alt bottom-left width height)
  (cons bottom-left (cons width height)))
(define (height-rect rect) (cdr (cdr rect)))
(define (width-rect rect) (car (cdr rect)))

;; Test
(define r1 (make-rect-alt (make-point 1 1) 4 8))
(perimeter-rect r1) ;Value: 24
(area-rect r1)      ;Value: 32
;; End
