(cd "./")
(load "example-tree.scm")

(define nil '())

;; scale-tree: tree -> int : tree
(define (scale-tree tree factor)
  (cond ((null? tree) nil)
	((not (pair? tree)) (* tree factor))
	(else (cons (scale-tree (car tree) factor)
		    (scale-tree (cdr tree) factor)))))
(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)
;; diagram
;;           (1 (2 (3 4 nil) 5 nil) (6 7 nil) nil)
;;       car/                   \cdr
;;        1           ((2 (3 4 nil) 5 nil) (6 7) nil)
;;                car/                             \cdr
;;            (2 (3 4 nil) 5 nil)            ((6 7) nil)
;;         car/                \cdr       car/         \cdr
;;           2       ((3 4 nil) 5 nil)   (6 7 nil)     nil
;;                  /              \     /       \
;;               (3 4 nil)      (5 nil) 6      (7 nil)
;;               /       \      /     \        /     \
;;              3      (4 nil) 5     nil      7      nil
;;                      /    \
;;                     4     nil
;;

;; because tree is constructed by list here, we can reuse map abstraction to define scale-tree, like scale-list.
(define (scale-tree-map tree factor)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (scale-tree-map sub-tree factor)
	     (* sub-tree factor)))
       tree))
(scale-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)
