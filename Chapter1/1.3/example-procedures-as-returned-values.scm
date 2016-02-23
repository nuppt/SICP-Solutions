(cd ".")
(load "example-fixed-points-of-function.scm")
;; take a function f, return another function
(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

;;---- Test ----;;
((average-damp square) 10)


;; reformulate square-root procedure in terms of fixed-point
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
(sqrt 4) ;Value: 2.000000000000002
(sqrt 8) ;Value: 2.82842712474619

;; easy to rewrite sqrt procedure into cube procedure
;; in terms of a simple fact: cube root of x is a fixed-point
;; of the function y |-> x/y^2
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))
(cube-root 9) ;Value: 2.0800819199926504



;; Newton's method to calculate the  solution of the equation g(x) = 0.
;; Step1: define derivative operator(导数算子)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)))

;; Step2: define an infinitesimal with a very little value
(define dx 0.00001)

;; begin Test ---- of deriv ----;;
(define (cube x) (* x x x))
(cube 5)         ;Value: 125 (= 5 * 5 * 5)
((deriv cube) 5) ;Value: 75.00014999664018 (= 3 * 5 * 5)
;; end Test

;; Step3: define transformational function in newton-method
;; The semantic of this function is that give me a function g, I will
;; return a new function f, which represent the transformational function of g
;; in newton-method.
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

;; Step4: define goal function of newton-method in terms of fixed-point
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))


;; begin Test ---- of newton-method ----;;
;; compute square-root of x
;; equal to find a zero of the function y |-> y^2 - x (starting with an initial guess of 1)
(define (sqrt x)
  (newton-method (lambda (y) (- (square y) x)) 10000))
(sqrt 9)   ;Value: 3.000000000000002
(sqrt 1.0) ;Value: 1.

(note: The guess initial number of the following expression shouldn't be 1,
otherwise the interpreter may hardly compute the result.)
(sqrt 1000000000000) ;;Value: 1000000.
;; end Test


;; High abstraction of fixed-point application
;; Main idea: Each method begins with a function and finds
;; a fixed point of some transformation of the function.
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

;; rewrite sqrt function in terms of this new high abstraction
(define (sqrt1 x)
  (fixed-point-of-transform (lambda (y) (/ x y))
			    average-damp
			    1.0))
(define (sqrt2 x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
			    newton-transform
			    1.0))
;; Begin Test ---- of sqrt1 and sqrt2 ----;;
(sqrt1 1) ;Value: 1.
(sqrt2 1) ;Value: 1.
(sqrt1 5) ;Value: 2.236067977499978
(sqrt2 5) ;Value: 2.2360679775020436
(sqrt1 1000) ;Value: 31.622776601684336
(sqrt2 1000) ;Value: 31.62277660168526
;; End Test
