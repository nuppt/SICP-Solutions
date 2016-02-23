(define nil '())
;;
;; two version of definition of square-tree
;;

(define (square-tree t)
  (cond ((null? t) nil)
	((not (pair? t)) (square t))
	(else (cons (square-tree (car t))
		    (square-tree (cdr t))))))
;; Test
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))  ;Value 13: (1 (4 (9 16) 25) (36 49))
;; End


(define (square-tree t)
  (map (lambda (sub-tree)
	 (if (not (pair? sub-tree))
	     (square sub-tree)
	     (square-tree sub-tree)))
       t))
;; Test
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))  ;Value 13: (1 (4 (9 16) 25) (36 49))
;; End
