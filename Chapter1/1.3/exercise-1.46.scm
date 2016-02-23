;; Process of iterative improvement
;;
;;                        guess-1
;;                     /           \
;;        good-enough /             \ not-good-enough
;;                   /               \
;;              guess-1             guess-2 (= improve-guess guess-1)
;;                                /         \
;;                   good-enough /           \ not-good-enough
;;                              /             \
;;                          guess-2          guess-3 (= improve-guess guess-2)
;;                                         /         \
;;                                       ...         ...
;;
;; Procedures
;; (define (iterative-improve good-enough? improve)
;;   (lambda (guess)
;;     ; ...
;;   ))

(define (close-enough? v1 v2)
  (define tolerance 1.e-6)
  (< (/ (abs (- v1 v2)) v2) tolerance))

(define (iterative-improve guess-is-good-enough? improve-guess)
  (lambda (x)
    (let ((xim (improve-guess x)))
      (if (close-enough? x xim)
	  xim
	  ((iterative-improve guess-is-good-enough? improve-guess) xim)))))

;; (a) rewrite sqrt using iterative-improve
(define (sqrt x)
  ((iterative-improve close-enough? (lambda (y) (/ (+ (/ x y) y) 2))) 1.0))

;; Begin Test ---- of sqrt ----;;
(sqrt 9)
(sqrt 4)
;; End Test


;; (b) rewrite fixed-point using iterative-improve
(define (sqrt-fix x)
  (define dx 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) dx))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  ((iterative-improve close-enough? improve) 1.0))

;; Begin Test ---- of fixed-point ----;;
(sqrt-fix 9)
;; End Test
