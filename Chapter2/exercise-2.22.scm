(cd "./")
(load "exercise-2.21.scm")

;; experiment
(define (square-list-iter-try1 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items '()))
(square-list-iter-try1 (list 1 2 3 4)) ;Value 86: (16 9 4 1)

(define (square-list-iter-try2 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items '()))
(square-list-iter-try2 (list 1 2 3 4)) ;Value 87: ((((() . 1) . 4) . 9) . 16)

;; Explain
;; To square-list-iter-try1,
;; Each (car items) will insert at the head of answer in iterative process,
;; that make the answer is in the reverse order of the one desired.

;; To square-list-iter-try2,
;; there is a obscure problem of cons: as we all know,
;; the appropriate type of arguments of cons is (T->list<T>->list<T>) to generate a valid list,
;; but, here we call square-list-iter-try2 by giving list<T> firstly and T secondly as arguments.

;; The correct version of square-list-iter
(define (square-list-iter items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (append answer (list (square (car things)))))))
  (iter items '()))
(square-list-iter (list 1 2 3 4)) ;Value 88: (1 4 9 16)
