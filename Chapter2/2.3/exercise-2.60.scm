(cd "./")
(load "example-representing-set-by-unordered-list.scm")

(define (element-of-multi-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-multi-set? x (cdr set)))))

(define (adjoin-multi-set x set)
  (cons x set))

(define (union-multi-set set1 set2)
  (append set1 set2))

(define (intersection-multi-set set1 set2)
  (append (intersection-set set1 set2)
          (intersection-set set2 set1)))

;; test
(define l (list 1 2 2 4))
(element-of-multi-set? 3 l)
(element-of-multi-set? 3 (adjoin-multi-set 3 l))
(element-of-multi-set? 3 (adjoin-multi-set 3 (adjoin-multi-set 3 l)))
(define m (list 4 3 2 1))
(union-multi-set l m)
(intersection-multi-set l m)
