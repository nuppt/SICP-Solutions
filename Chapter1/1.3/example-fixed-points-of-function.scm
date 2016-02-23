(define (average x y)
  (/ (+ x y) 2))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

;; example
;; x = cos(x)
(fixed-point cos 1.0)  ;Value: .7390822985224023
;; y = sin(y) + cos(y)
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)  ;Value: 1.2587315962971173


;; compute sqrt(x) in terms of finding 'fixed-point'
;; y^2 = x  ->
;; y = x/y  (not converge, so continue to transform)  ->
;; y = (y + x/y) / 2
(define (sqrt-wrong x)
  (fixed-point (lambda (y) (/ x y)) 1.0))
;(sqrt-wrong 4)  ; stuck in infinite loop
;(sqrt-wrong 9)  ; stuck in infinite loop
(define (sqrt-right x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
(sqrt-right 9)   ;Value: 3.
(sqrt-right 10)  ;Value: 3.162277660168379
(sqrt-right 16)  ;Value: 4.000000000000051
