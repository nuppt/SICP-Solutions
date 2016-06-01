(cd "./")
(load "example-representing-set-by-ordered-list.scm")
(load "example-representing-set-by-binary-tree.scm")
(load "exercise-2.64.scm")

(define (union-set-by-binary-tree set1 set2)
  (list->tree (union-set (tree->list-2 set1)
                         (tree->list-2 set2))))



(define (intersection-set-by-binary-tree set1 set2)
  (list->tree (intersection-set (tree->list-2 set1)
                                (tree->list-2 set2))))


;; test
(define t1
  (make-tree 3
             (make-tree 1 '() '())
             (make-tree 7
                        (make-tree 5 '() '())
                        (make-tree 9
                                   '()
                                   (make-tree 11 '() '())))))
(define t2
  (make-tree 5
             (make-tree 1
                        '()
                        (make-tree 3 '() '()))
             (make-tree 9
                        (make-tree 6 '() '())
                        (make-tree 10 '() '()))))

(union-set-by-binary-tree t1 t2)  ;; (6 (3 (1 () ()) (5 () ())) (9 (7 () ()) (10 () (11 () ()))))
(intersection-set-by-binary-tree t1 t2)  ;; (3 (1 () ()) (5 () (9 () ())))
