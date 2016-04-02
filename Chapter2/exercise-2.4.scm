(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

;; verify (car (cons (x y))) in terms of applicative-order substitution model
;; (car (cons (a b))) ->
;; (car (lambda (m) (m a b))) ->
;; ((lambda (m) (m a b)) (lambda (p q) p)) ->
;; ((lambda (p q) p) a b) ->
;; a

;; definition of cdr
(define (cdr z)
  (z (lambda (p q) q)))

;; Test
(define x (cons 1 2))
(car x)
(cdr x)
;; End
