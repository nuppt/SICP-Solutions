(cd "./")
(load "exercise-2.13.scm")

(define A (make-center-percent 10 0.01))
(define B (make-center-percent 20 0.01))

;; there is no identity on operations of interval.
(div-interval A A) ;; not [1,1] but [.9801980198019803 . 1.02020202020202]
(div-interval A B)
