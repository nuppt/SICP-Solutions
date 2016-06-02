(cd "./")
(load "example-huffman-encoding-trees.scm")
(load "exercise-2.68.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (cond ((null? set) '())
        ((= 1 (length set)) (car set))
        (else (successive-merge (adjoin-set (make-code-tree (car set)
                                                            (cadr set))
                                            (cddr set))))))

;; test
;;(trace successive-merge)
;;(trace adjoin-set)
(define tree
  (generate-huffman-tree (list '(A 4)
                               '(B 2)
                               '(C 1)
                               '(D 1))))
(encode '(A D A B B C A) tree)  ;; (0 1 1 0 0 1 0 1 0 1 1 1 0)
(decode '(0 1 1 0 0 1 0 1 0 1 1 1 0) tree)  ;; (a d a b b c a)

(untrace)
