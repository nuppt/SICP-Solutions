(cd "./")
(load "example-huffman-encoding-trees.scm")

;; encode each element of message in sequence order
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;;(trace encode-symbol-traverse)
;;(trace encode-symbol)
;;(trace encode)
 (define (element-of-set? x set)
   (cond ((null? set) false)
         ((equal? x (car set)) true)
         (else (element-of-set? x (cdr set)))))

(define (encode-symbol symbol tree)
  ;; check 'bh' branch contains symbol or not
  (define (correct-branch? bh)
    (if (leaf? bh)
        (equal? symbol (symbol-leaf bh))
        (element-of-set? symbol (symbols bh))))

  (let ((lbranch (left-branch tree))
        (rbranch (right-branch tree)))
    (cond ((correct-branch? lbranch) (if (leaf? lbranch) '(0) (cons 0 (encode-symbol symbol lbranch))))
          ((correct-branch? rbranch) (if (leaf? rbranch) '(1) (cons 1 (encode-symbol symbol rbranch))))
          (else (error "bad symbol -- ENCODE-SYMBOL" symbol)))))


;; test
(define tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1)
                                                  (make-leaf 'C 1)))))
(encode '(A D A B B C A) tree)  ;; (0 1 1 0 0 1 0 1 0 1 1 1 0)
(decode '(0 1 1 0 0 1 0 1 0 1 1 1 0) tree)  ;; (a d a b b c a)

(encode '(A D F B) tree)  ;;bad symbol -- ENCODE-SYMBOL f
(untrace)
