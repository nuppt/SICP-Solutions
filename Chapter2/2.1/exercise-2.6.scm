(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; define directly procedural representations of one and two
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;; use "applicative-order" substitution to evaluate (add-1 zero)
;; (add-1 zero) ->
;; (add-1 (lambda (f) (lambda (x) x))) ->
;; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))) ->
;; (lambda (f) (lambda (x) (f ((lambda (x) x) x)))) ->
;; (lambda (f) (lambda (x) (f x))) ->
;; one

;; define directly the addition procedure +
(define (f-plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))


;; Test
;; To test functions of Church-numerals above, let's try to get a way of converting between Church-numerals and integers.
;; After that, we can check the result in integers to insure the correctness of all representations of Church-numerals.
(define (convert-int-to-church n)
  (if (= n 0)
      zero
      (add-1 (convert-int-to-church (- n 1)))))
(define (convert-church-to-int n)
  (define (inc x) (+ 1 x))
  ((n inc) 0))

(convert-church-to-int (f-plus one two))          ;Value: 3
(convert-church-to-int (f-plus one (add-1 two)))  ;Value: 4
(convert-church-to-int (add-1 (f-plus one two)))  ;Value: 4

(convert-church-to-int (convert-int-to-church 0))  ;Value: 0
(convert-church-to-int (convert-int-to-church 1))  ;Value: 1
(convert-church-to-int (convert-int-to-church 25)) ;Value: 25
;; End
