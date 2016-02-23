;; (((double (double double)) inc) 5)
;; -> 21

(define (double-procedure f)
  (lambda (x) (f (f x))))
(define (inc x) (+ x 1))
(((double-procedure (double-procedure double-procedure)) inc) 5)
