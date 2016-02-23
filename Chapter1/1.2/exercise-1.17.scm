;; Linear algorithm for multiplication
(define (multi-linear a b)
  (if (= b 0)
      0
      (+ a (multi-linear a (- b 1)))))

(multi-linear 2 3)
(multi-linear 10 100)

;; Logarithmic algorithm for multiplication
;; based on +, double, halve
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (multi-log a b)
  (cond ((= b 0) 0)
	((even? b) (multi-log (double a) (halve b)))
	(else (+ a (multi-log a (- b 1))))))
(multi-log 2 0)
(multi-log 2 1)
(multi-log 2 2)
(multi-log 2 3)
(multi-log 2 4)
(multi-log 2 5)
(multi-log 10 100)


;; difference between executing two algorithms
;; because of need of space in process, multi-linear cann't give a result, when multi-log give the right answer
(multi-linear 10000000000000000 10000000000000000) ;;Aborting!: maximum recursion depth exceeded
(multi-log 10000000000000000 10000000000000000) ;;Value: 100000000000000000000000000000000
