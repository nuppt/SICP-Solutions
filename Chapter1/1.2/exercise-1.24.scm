(define (exer-1.24:report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  true)

(define (exer-1.24:start-prime-test n start-time)
  (if (fast-prime? n 100000)
      (exer-1.24:report-prime n (- (real-time-clock) start-time))
      false))

(define (exer-1.24:timed-prime-test n)
  (exer-1.24:start-prime-test n (real-time-clock)))


(exer-1.24:timed-prime-test 100000007)
(exer-1.24:timed-prime-test 100000037)
(exer-1.24:timed-prime-test 100000039)
(exer-1.24:timed-prime-test 100000038)
(exer-1.24:timed-prime-test 1000003)
(exer-1.24:timed-prime-test 1009)

(runtime)
