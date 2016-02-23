(cd ".")
(load "exercise-1.42.scm")

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

;; Begin Test ---- of repeated ----;;
((repeated square 2) 5) ;Value: 625
((repeated square 2) 5.0)
;; End Test
