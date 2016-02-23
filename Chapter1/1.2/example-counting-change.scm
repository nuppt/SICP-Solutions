(define (count-change a) (cc a 5))

(define (cc a n)
  (cond ((= a 0) 1)
	((or (< a 0) (= n 0)) 0)
	(else (+ (cc a (- n 1))
		 (cc (- a (first-denomination n)) n)))))

(define (first-denomination n)
  (cond ((= n 1) 1)
	((= n 2) 5)
	((= n 3) 10)
	((= n 4) 25)
	((= n 5) 50)))


;; testcase
(count-change 100)  ;; 292
(count-change 200)  ;; 2435
(count-change 300)  ;; 9590
(count-change 400)  ;; 26517
(count-change 500)  ;; 59576
