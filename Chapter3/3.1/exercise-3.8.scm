(define f
  (let ((st 1))
    (lambda (x)
      (cond ((= st 0) st)
            (else (begin (set! st 0)
                         x))))))

;; Main idea: different route of calculation of f would affect the state variable st.
;; Test
(+ (f 0) (f 1))
(+ (f 1) (f 0))
