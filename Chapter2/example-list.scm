(define one-through-four (list 1 2 3 4))
one-through-four
(car one-through-four)
(cdr one-through-four)
(car (cdr one-through-four))
(cons 10 one-through-four)
(cons 5 one-through-four)
(cadr one-through-four)
(= (car (cdr one-through-four))
   (cadr one-through-four))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
;; Test begin
(define squares (list 1 4 9 16 25))
(list-ref squares 3)
;; (list-ref squares 5) ; will trigger error: ;The object (), passed as the first argument to car, is not the correct type.
;; End

;; Define length procedure of list in recursive way
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
;; Test
(define odds (list 1 3 5 7))
(length odds)
;; End

;; Define length procedure of list in iterative style
(define (length-iter items)
  (define (iter a count)
    (if (null? a)
	count
	(iter (cdr a) (+ count 1))))
  (iter items 0))
;; Test
(length-iter odds)
;; End


(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(append squares odds)
(append odds squares)
