(cd "./")
(load "example-representing-set-by-ordered-list.scm")

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((<= x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

;; test
(adjoin-set 3 '())
(adjoin-set 3 (list 2))
(adjoin-set 3 (list 3))
(adjoin-set 3 (list 4))
(adjoin-set 3 (list 1 1 2 4 5))
(adjoin-set 3 (list 1 1 2 3 4 5))
