(cd ".")
(load "exercise-1.43.scm")

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
(define (smooth-n-fold f n)
  ((repeated smooth n) f))


;; Begin Test ---- of smooth-n-fold ----;;
((smooth-n-fold square 2) 5) ;Value: 25.00000000013333
;; End Test
