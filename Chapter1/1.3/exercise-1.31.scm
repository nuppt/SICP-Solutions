;; forall i in {a, (next a), (next (next a)), ... b}.
;;     result *= (term i)


;; a. recurtive version
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

(define (term-in-numerator x)
  (cond ((= x 0) 2)
	((odd? x) (+ 2 (term-in-numerator (- x 1))))
	(else (term-in-numerator (- x 1)))))

(define (term-in-denominator x)
  (cond ((= x 0) 3)
	((odd? x) (term-in-denominator (- x 1)))
	(else (+ 2 (term-in-denominator (- x 1))))))

(define (next x) (+ 1 x))


(product-rec term-in-numerator 0 next 100)
(product-rec term-in-denominator 0 next 100)

;; compute approximations to PI
(* 4.0 (/ (product-rec term-in-numerator 0 next 100) (product-rec term-in-denominator 0 next 100)))    ;Value: 3.1263793980429817
(* 4.0 (/ (product-rec term-in-numerator 0 next 1000) (product-rec term-in-denominator 0 next 1000)))  ;Value: 3.140026946105016




;; b. iterative version
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	1
	(* (term a) (* result (iter (next a) result)))))
  (iter a 1))

(product-iter term-in-numerator 0 next 100)
(product-iter term-in-denominator 0 next 100)
;; compute approximations to PI
(* 4.0 (/ (product-iter term-in-numerator 0 next 100) (product-rec term-in-denominator 0 next 100)))    ;Value: 3.1263793980429817
(* 4.0 (/ (product-iter term-in-numerator 0 next 1000) (product-rec term-in-denominator 0 next 1000)))  ;Value: 3.140026946105016
