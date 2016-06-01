(cd "~/Code_Set/Github/nuppt/SICP/Chapter2/")
(load "example-symbolic-differentiation.scm")

;; Some pre-knowledge
;; operations on list
;; (car l) => first item of l
;; (cdr l) => rest items of l
;; (cadr l) => (car (cdr l)) => second items of l
;; (caddr l) => (car (cdr (cdr l))) => third items of l
;; ...


;; expend expression of (+ a b) and (* a b) that operator can handle any number of arguments
;; eg. (+ a b c d)
;; We need to give this 'new' expression a proper and precise semantic.

;; Rule of semantic of +:
;; (+ a1 a2 ... an) =
;; (+ a1 (+ a2 ... an)) =
;; Rule of semantic of *:
;; (* a1 a2 ... an) =
;; (* a1 (* a2 ... an)) =
;; With this rule, we can deduce the expression into the original format.
(define (addend e)
  (cadr e))
(define (augend e)
  (if (null? (cdddr e))
      (caddr e)
      (cons '+ (cddr e))))

(define (multiplier e)
  (cadr e))
(define (multiplicand e)
  (if (null? (cdddr e))
      (caddr e)
      (cons '* (cddr e))))

;; Test
(addend '(+ x 3))
(addend '(+ x y z))
(augend '(+ x 3))
(augend '(+ x y z))
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(* x y (+ x 3)) 'x)
