;; simple graphical representation of line segment in a plane
;; ..........
;; .......*..
;; ....../...
;; ...../....
;; ..../.....
;; ...*......
;; ..........

;; Define segment type
(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Define an operation on segment type
;; We can simply express the semantic of midpoint-seg:
;; give me a segment type, I will return a point type to you.
;; This return value in point type is the midpoint of inputed segment.
(define (midpoint-seg segment)
  (make-point (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
	      (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)))

(define (print-segment segment)
  (print-point (start-segment segment))
  (print-point (end-segment segment)))

;; Test
(print-point (make-point 0 0))
(print-point (make-point 1 4))
(print-segment (make-segment (make-point 0 0) (make-point 1 4)))

(display (x-point (make-point 2 5)))
(display (y-point (make-point 2 5)))

(print-point (start-segment (make-segment (make-point 0 0) (make-point 1 4))))
(print-point (end-segment (make-segment (make-point 0 0) (make-point 1 4))))

(print-point (midpoint-seg (make-segment (make-point 0 0) (make-point 1 4))))   ;; (1/2,2)
(print-point (midpoint-seg (make-segment (make-point -5 3) (make-point 1 -4)))) ;; (-2,-1/2)
;; End
