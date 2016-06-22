(load "../example-symbolic-differentiation.scm")

;; Symbolic Differentiation
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var)
                             1
                             0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; a.
;; There are two different expressions with operator, one is +, another is *.
;; So, the code above just abstract from these two different representations.
;; Obviously, we cann't assimilate the predicates number? and variable? into the data-directed dispatch
;; because there is no id for number? and variable? expressions.

;; b.
(define (install-deriv-package)
  ;; internal procedures of sum and mul expression types
  (define (make-sum exp1 exp2)
    (cond ((eq? exp1 0) exp2)
          ((eq? exp2 0) exp1)
          ((and (number? exp1) (number? exp2)) (+ a b))
          (else (list '+ exp1 exp2))))
  (define (addend exp)
    (cadr exp))
  (define (augend exp)
    (caddr exp))
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  (define (make-product exp1 exp2)
    (cond ((or (eq? exp1 0) (eq? exp2 0)) 0)
          ((eq? exp1 1) exp2)
          ((eq? exp2 1) exp1)
          ((and (number? exp1) (number? exp2)) (* exp1 exp2))
          (else (list '* exp1 exp2))))
  (define (multiplier exp)
    (cadr exp))
  (define (multiplicand exp)
    (caddr exp))
  (define (deriv-product exp var)
    (make-sum (make-product (multiplier exp)
                            (deriv (multiplicand exp) var))
              (make-product (multiplicand exp)
                            (deriv (multiplier exp) var))))

  ;; interfaces of rest part of system
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  'done)

;; c.
(define (install-deriv-exponentation-package exp var)
  (define (make-exponentation base exponent)
    (cond ((eq? exponent 0) 1)
          ((eq? exponent 1) base)
          ((eq? base 1) 1)
          ((and (number? base) (number? exponent)) (* base (make-exponentation base (- exponent 1))))
          (else (list '** base exponent))))
  (define (base exp)
    (cadr exp))
  (define (exponent exp)
    (caddr exp))
  (define (deriv-exponentation exp var)
    (make-product (exponent exp)
                  (make-product (make-exponentation (base exp)
                                                    (make-sum (exponent -1)))
                                (deriv (base exp) var))))
  (put 'deriv '** deriv-exponentation)
  'done)


;; d.
;; just change those 'put' sentence, for example,
;; (put 'deriv '** deriv-exponent) --> (put '** 'deriv deriv-exponent)
