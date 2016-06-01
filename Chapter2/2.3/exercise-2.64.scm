(cd "./")
(load "example-representing-set-by-binary-tree.scm")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))

;; test
(list->tree (list 1 2 3 4 5))
(tree->list-2 (list->tree (list 1 2 3 4 5)))

;; a.
;; explanation of how partial-tree works
;; The goal of partial-tree is to build a binary tree with first n elements in elts.
;; As we all know, to build a binary tree, we should use the constructor of binary tree.
;; So, the main idea is to divide the elts into three parts: left-branch, entry and right-branch,
;; we can see that the let expressions in multi-level just be used to compute these.
;; After that, we just build the binary tree by a single expression:
;;   (cons (make-tree this-entry
;;                    left-tree
;;                    right-tree)
;;         remaining-elts)
;;
;; Draw the tree produced by (list->tree (list 1 3 5 7 9 11)))
(list->tree (list 1 3 5 7 9 11))  ;; (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
;;               5
;;           /      \
;;         1          9
;;       /  \       /   \
;;     nil  3     7      11
;;        / \    / \     / \
;;      nil nil nil nil nil nil

;; b.
;; T(n) = 2*T(n/2) + 1
;;      = O(n)
