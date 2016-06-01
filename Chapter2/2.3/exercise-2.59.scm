(cd "./")
(load "example-representing-set-by-unordered-list.scm")


;; union-set
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))

;; test
(union-set (list 1 2 3) (list 3 2 4))  ;Value 14: (1 3 2 4)
