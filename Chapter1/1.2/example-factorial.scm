;; factorial:
// n! = n * (n-1) * (n-2) * ... * 1

;; factorial recursion version
(define (factorial-rec n)
  (if (= n 0)
      1
      (* n (factorial-rec (- n 1)))))

(factorial-rec 0)  ;; 1
(factorial-rec 1)  ;; 1
(factorial-rec 2)  ;; 2
(factorial-rec 3)  ;; 6
(factorial-rec 4)  ;; 24


;; factorial iteration version
;; product <- product * counter
;; counter <- counter + 1
(define (factorial-iter n)
  (define (fact-iter product counter)
    (if (> counter n)
	product
	(fact-iter (* product counter)
		   (+ counter 1))))
  (fact-iter 1 1))

(factorial-iter 0)
(factorial-iter 1)
(factorial-iter 2)
(factorial-iter 3)
(factorial-iter 4)
