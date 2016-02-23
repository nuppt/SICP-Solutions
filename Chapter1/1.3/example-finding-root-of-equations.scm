(define (average a b) (/ (+ a b) 2))
(define (close-enough? a b) (< (abs (- a b)) 0.001))
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
	midpoint
	(let ((test-value (f midpoint)))
	  (cond ((positive? test-value) (search f neg-point midpoint))
		((negative? test-value) (search f midpoint pos-point))
		(else midpoint))))))

;; example
;; f: x -> x + 1
;; f(-1) = 0
(search (lambda (x) (+ x 1)) -2 0) ;Value: -1
(search (lambda (x) (+ x 1)) -4 5) ;Value: -32765/32768
(search (lambda (x) (+ x 1)) -5 5) ;Value: -16385/16384
;; f: x -> x^2 - 1
;; f(-1) = f(1) = 0
(search (lambda (x) (- (square x) 1)) -2 0) ;Value: -1
(search (lambda (x) (- (square x) 1)) 0 2)  ;Value: 1
(search (lambda (x) (- (square x) 1)) -2 -1);Value: -4095/2048, wrong answer


(define (half-interval-method f a b)
  (let ((a-value (f a))
	(b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
	   (search f a b))
	  ((and (negative? b-value) (positive? a-value))
	   (search f b a))
	  (else (error "Values are not of opposite sign" a b)))))

;; example
;; try the expression with wrong answer above, will give the error message:
;Values are not of opposite sign -2 -1
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.
(half-interval-method (lambda (x) (- (square x) 1)) -2 -1)
(half-interval-method (lambda (x) (- (square x) 1)) -2 -0.9)  ;Value: -1.0001708984375002
;; sin(PI*n) = 0  ->
;; 2.0 <= PI*n <= 4.0  ->
;; n = 1 && 2.0 <= PI <= 4.0
(half-interval-method sin 2.0 4.0)  ;Value: 3.14111328125
;; x^3 - 2x - 3 = 0
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
		      1.0
		      2.0)  ;Value: 1.89306640625
