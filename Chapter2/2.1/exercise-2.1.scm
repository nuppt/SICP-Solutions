(cd "./")
(load "example-arithmetic-operations-for-rational-numbers.scm")
(define (make-rat n d)
  (if (>= (* n d) 0)
      (let ((n (abs n))
	    (d (abs d))
	    (g (gcd n d)))
	(cons (/ n g) (/ d g)))
      (let ((n (abs n))
	    (d (abs d))
	    (g (gcd n d)))
	(cons (/ (- n) g) (/ d g)))))

;; Test
(print-rat (make-rat -1 -6))  ;; 1/6
(car (make-rat -1 -6))  ;; 1 (not -1)
(cdr (make-rat -1 -6))  ;; 6 (not -6)
(print-rat (make-rat 1 -6))   ;; -1/6
(car (make-rat 1 -6))   ;; -1 (not 1)
(cdr (make-rat 1 -6))   ;; 6 (not -6)
;; End
