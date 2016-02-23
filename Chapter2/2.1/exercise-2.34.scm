(load "example-sequences-as-conventional-interfaces.scm")

;; a_n*x^n + a_n-1*x^(n-1) + ... + a_1*x + a_0 =
;; (...(a_n*x + a_n-1)*x + ... + a_1)*x + a_0 =
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
		(+ this-coeff (* higher-terms x)))
	      0
	      coefficient-sequence))

;; f(x) = 1 + 3*x + 5*x^3 + x^5
;; compute f(2)
(horner-eval 2 (list 1 3 0 5 0 1))  ;Value: 79
(horner-eval 2 (list 2 3 0 5 0 1))  ;Value: 80
(untrace)
