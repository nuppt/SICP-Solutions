(cd "./")
(load "example-list.scm")

(define (last-pair l)
  (cond ((null? l) ())
	((= (length l) 1) (car l))
	(else (last-pair (cdr l)))))

(last-pair (list 23 72 149 34))
(last-pair (list 23))
