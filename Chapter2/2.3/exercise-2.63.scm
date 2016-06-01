(cd "./")
(load "example-representing-set-by-binary-tree.scm")

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

;; a.
;; Both procedures produce the same result because they both are in-order traversals.

(define t
  (make-tree 2
             (make-tree 1 '() '())
             (make-tree 3 '() '())))

(tree->list-1 t)  ;; (1 2 3)
(tree->list-2 t)  ;; (1 2 3)

;; consturct trees in figure-2.16
(define t1
  (make-tree 7
             (make-tree 3
                        (make-tree 1 '() '())
                        (make-tree 5 '() '()))
             (make-tree 9
                        '()
                        (make-tree 11 '() '()))))
(tree->list-1 t1)  ;; (1 3 5 7 9 11)
(tree->list-2 t1)  ;; (1 3 5 7 9 11)

(define t2
  (make-tree 3
             (make-tree 1 '() '())
             (make-tree 7
                        (make-tree 5 '() '())
                        (make-tree 9
                                   '()
                                   (make-tree 11 '() '())))))
(tree->list-1 t2)  ;; (1 3 5 7 9 11)
(tree->list-2 t2)  ;; (1 3 5 7 9 11)

(define t3
  (make-tree 5
             (make-tree 3
                        (make-tree 1 '() '())
                        '())
             (make-tree 9
                        (make-tree 7 '() '())
                        (make-tree 11 '() '()))))
(tree->list-1 t3)  ;; (1 3 5 7 9 11)
(tree->list-2 t3)  ;; (1 3 5 7 9 11)


;; b.
;; Lemma: the time complexity of append operation on set1 and set2 is O(size(set1))
;; Conclusion:
;;   the time complexity of tree->list-1 is O(n*logn)
;;   the time complexity of tree->list-2 is O(n)
;; Prove:
;; tree->list-1:
;;   if size(tree) = n, then
;;   then T(n) = 2*T(n/2) + n/2
;;        T(n/2) = 2*T(n/4) + n/4
;;   ...
;;        T(2) = 2*T(1) + 1
;;   there are logn expressions above.
;;   so after simplification,
;;        T(n) = 2^(logn) + n/2 * logn
;;             = n + (nlogn)/2
;; tree->list-2:
;;   if size(tree) = n, then
;;   then T(n) = 2*T(n/2) + 1
;;   so, T(n) = n
