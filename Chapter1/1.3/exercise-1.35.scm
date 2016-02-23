(load "./example-fixed-points-of-function.scm")
(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
(golden-ratio)  ;Value: 1.6180327868852458
