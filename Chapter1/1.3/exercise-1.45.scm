;; 2-th-root:
;;   y^2 = x  =>  y = x/y
;; 3-th-root:
;;   y^3 = x  =>  y = x/y^2
;; ...
;; n-th-root:
;;   y^n = x  =>  y = x/y^(n-1)
;;
;; To compute the solution of equation y^n = x, we can compute the fixed point of function x/y^(n-1) instead.
;; As example before, use average-damping technique to make fixed point process converge, but different n-th-roots
;; need different times of average-damping.

(cd ".")
(load "example-procedures-as-returned-values.scm")
(load "../1.2/example-expt.scm")
(load "exercise-1.43.scm")

(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (damped-nth-root n damp-times)
  (lambda (x) (fixed-point (average-damp-n-times
			    (lambda (y)
			      (/ x (fast-expt y (- n 1))))
			    damp-times)
			   1.0)))
;; Use 2-th-root, 3-th-root and 4-th-root to test basic functions
(define sqrt (damped-nth-root 2 1))
(sqrt (square 3)) ;Value: 3.
(define cube-root (damped-nth-root 3 1))
(cube-root (cube 3)) ;Value: 2.9999972321057697
(define 4-th-root (damped-nth-root 4 2))
(4-th-root (fast-expt 3 4)) ;Value: 3.000000000000033


;; do experiment to find rule of condition of convergence.
;; n-th-root             1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  ...  n
;; average-damp-n-times  0  1  1  2  2  2  2  3  3  3   3   3   3   3   3   4   ...  log(n)
(define 1-th-root (damped-nth-root 1 0))
(1-th-root (fast-expt 3 1)) ;Value: 3

(define 5-th-root (damped-nth-root 5 2))
(5-th-root (fast-expt 3 5)) ;Value: 3.0000008877496294
(define 6-th-root (damped-nth-root 6 2))
(6-th-root (fast-expt 3 6)) ;Value: 2.999996785898161
(define 7-th-root (damped-nth-root 7 2))
(7-th-root (fast-expt 3 7)) ;Value: 3.0000041735235943
(define 8-th-root (damped-nth-root 8 3))
(8-th-root (fast-expt 3 8)) ;Value: 3.0000000000173292
(define 9-th-root (damped-nth-root 9 3))
(9-th-root (fast-expt 3 9)) ;Value: 2.9999993492954617
(define 10-th-root (damped-nth-root 10 3))
(10-th-root (fast-expt 3 10)) ;Value: 2.999998262474574
(define 11-th-root (damped-nth-root 11 3))
(11-th-root (fast-expt 3 11)) ;Value: 3.000002135562327
(define 12-th-root (damped-nth-root 12 3))
(12-th-root (fast-expt 3 12)) ;Value: 3.000003243693911
(define 13-th-root (damped-nth-root 13 3))
(13-th-root (fast-expt 3 13)) ;Value: 2.9999967990518375
(define 14-th-root (damped-nth-root 14 3))
(14-th-root (fast-expt 3 14)) ;Value: 2.999995914860136
(define 15-th-root (damped-nth-root 15 3))
(15-th-root (fast-expt 3 15)) ;Value: 3.000004202219401
(define 16-th-root (damped-nth-root 16 4))
(16-th-root (fast-expt 3 16)) ;Value: 3.


;; Conclusion
;; Foreach n-th-root, the least requirement of times of application of average-damping is log(n) (based on 2).
