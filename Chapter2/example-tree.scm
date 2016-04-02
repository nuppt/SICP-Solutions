(cd "./")
(load "example-list.scm")

;; a tree can be seen as the representation constructed by list, for example:
;;         ((a b) (c d e))
;;          /          \
;;        (a b)      (c d e)
;;        /   \       /   \
;;       a     b     c   (d e)
;;                        / \
;;                       d   e


(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))

(define x (cons (list 1 2) (list 3 4)))
;;(length x) ;; wrong
(count-leaves x) ;; right
;;(length (list x x)) ;; wrong
(count-leaves (list x x)) ;; right
