(define (cube x) (* x x x))
;; compute the solution of x^3 + a*x^2 + b*x + c = 0
(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))


;; Begin Test ---- of cubic ----;;
(newton-method (cubic 1 2 3) 1)
(newton-method (cubic -3 -3 1) 1)
;; End Test
