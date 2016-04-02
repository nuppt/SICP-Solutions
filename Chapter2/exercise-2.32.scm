(define nil '())
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (cons (car s) x)) rest)))))

;; Test
(subsets (list 1 2 3))  ;Value 16: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;; End

;; Explaination why it works
;; to compute subsets of s = (a1, a2, a3, ..., an), we can compute two cases instead:
;;   Case 1. (without a1)
;;     compute (subsets s'), s' = (a2, a3, ..., an)
;;   Case 2. (with a1)
;;     forall (subsets s'), insert element a1 into each element of (subsets s').
