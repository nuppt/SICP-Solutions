(cd "./")
(load "example-mapping-over-lists.scm")

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))
(square-list (list 1 2 3 4))

(define (square-list items)
  (map-list square items))  ;; this map-list is same as map keyword in lisp.
(square-list (list 1 2 3 4))
