(cd "~/Code_Set/Github/nuppt/SICP/Chapter2/")
(load "example-symbolic-differentiation.scm")

;; a. (x + (3 * (x + (y + 2))))
(define (sum? e)
  (and (pair? e) (eq? (cadr e) '+)))
(define (addend e)
  (car e))
(define (augend e)
  (caddr e))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

;;(define (make-sum a1 a2)
;;  (list a1 '+ a2))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))


(define (product? e)
  (and (pair? e) (eq? (cadr e) '*)))

(define (multiplier e)
  (car e))

(define (multiplicand e)
  (caddr e))

;;(define (make-product m1 m2)
;;  (list m1 '* m2))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))


(deriv '(x + (3 * (x + (y + 2)))) 'x)  ;; 4


;; b. (x + 3 * (x + y + 2))
;; Harder than a.
;; We should give some rules to compute these expressions in proper order.
(define (ordinary-sum? e)
  )
