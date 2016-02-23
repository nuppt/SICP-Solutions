;; recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 20)
(f 100)  ;; hard to give a result

;; iterative process
;; f_n <- f_n_1 + 2*f_n_2 + 3*f_n_3
;; see it as a loop structure:
;; (f-iter 2 1 0 3) is initial conditions
;; (> counter n) is boundary judgement
;; (f-iter ...) is setting for state variables
(define (f n)
  (define (f-iter f_n_1 f_n_2 f_n_3 counter)
    (if (> counter n)
	f_n_1
	(f-iter (+ f_n_1 (* 2 f_n_2) (* 3 f_n_3)) f_n_1 f_n_2 (+ counter 1))))
  (f-iter 2 1 0 3))
(f 5)
(f 20)
(f 25)
(f 100)  ;; easy to calculate by iterative way
