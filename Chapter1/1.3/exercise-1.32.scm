(cd "./")
(load "exercise-1.31.scm")

;; a. Recurtive version
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

;; Test with:
;; combiner: *
;; null-value: 1
(accumulate * 1 term-in-numerator 0 next 100)
(accumulate * 1 term-in-denominator 0 next 100)
;; compute approximations to PI
(* 4.0 (/ (accumulate * 1 term-in-numerator 0 next 100) (accumulate * 1 term-in-denominator 0 next 100)))    ;Value: 3.1263793980429817
(* 4.0 (/ (accumulate * 1 term-in-numerator 0 next 1000) (accumulate * 1 term-in-denominator 0 next 1000)))  ;Value: 3.140026946105016



;; b. Iterative version
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	null-value
	(combiner (term a) (combiner result (iter (next a) result)))))
  (iter a null-value))

;; Test with:
;; combiner: *
;; null-value: 1
(accumulate-iter * 1 term-in-numerator 0 next 100)
(accumulate-iter * 1 term-in-denominator 0 next 100)
;; compute approximations to PI
(* 4.0 (/ (accumulate-iter * 1 term-in-numerator 0 next 100) (accumulate * 1 term-in-denominator 0 next 100)))    ;Value: 3.1263793980429817
(* 4.0 (/ (accumulate-iter * 1 term-in-numerator 0 next 1000) (accumulate * 1 term-in-denominator 0 next 1000)))  ;Value: 3.140026946105016
