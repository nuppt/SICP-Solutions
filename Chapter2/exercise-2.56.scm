(cd "~/Code_Set/Github/nuppt/SICP/Chapter2/")
(load "example-symbolic-differentiation.scm")

(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
	((=number? e 1) b)
	(else (list '** b e))))

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var)
			     1
			     0))
	((sum? exp) (make-sum (deriv (addend exp) var)
			      (deriv (augend exp) var)))
	((product? exp) (make-sum (make-product (multiplier exp)
						(deriv (multiplicand exp) var))
				  (make-product (multiplicand exp)
						(deriv (multiplier exp) var))))
	;; d(u^n)/dx = n * u^(n-1) * (du/dx)
	;; exp = u^n, var = x
	((exponentiation? exp) (make-product (exponent exp)
					     (make-product (make-exponentiation (base exp)
										(if (number? (exponent exp))
										    (- (exponent exp) 1)
										    (list '- (exponent exp) 1)))
							   (deriv (base exp) var))))
	(else (error "unknown expression type: DERIV" exp))))


;; Test
(deriv '(** x 0) 'x)
(deriv '(** x 1) 'x)
(deriv '(** x 2) 'x)
(deriv '(** x 3) 'x)
(deriv '(** x n) 'x)
(deriv '(** x (** x n)) 'x)
