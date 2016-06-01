(cd "./")
(load "example-representing-set-by-binary-tree.scm")

(define (lookup-in-binary-tree given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((= given-key (entry set-of-records)) true)
        ((< given-key (entry set-of-records))
         (lookup-in-binary-tree given-key (left-branch set-of-records)))
        ((> given-key (entry set-of-records))
         (lookup-in-binary-tree given-key (right-branch set-of-records)))))

;; test
(define t
  (make-tree 3
             (make-tree 1 '() '())
             (make-tree 7
                        (make-tree 5 '() '())
                        (make-tree 9
                                   '()
                                   (make-tree 11 '() '())))))
(lookup-in-binary-tree 11 t) ;; #t
(lookup-in-binary-tree 8 t)  ;; #f
