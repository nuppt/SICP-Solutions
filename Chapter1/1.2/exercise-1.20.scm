(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

;; illustrate the process in normal-order evaluation
;; (gcd 206 40)
;; -> (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;; -> (gcd (40 (remainder 206 40)))
;; -> (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))  ; remainder 1
;; -> (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;; ->
;; (if (= (remainder 40 (remainder 206 40)) 0)
;;     (remainder 206 40)
;;     (gcd (remainder 40 (remainder 206 40))
;;	    (remainder (remainder 206 40)
;;	    (remainder 40 (remainder 206 40)))))  ; remainder 2
;; -> (gcd (remainder 40 (remainder 206 40))
;;	   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; ->
;; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;;     (remainder 40 (remainder 206 40))
;;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;          (remainder (remainder 40 (remainder 206 40))
;;                     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))  ;; remainder 4
;; ->
;; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;      (remainder (remainder 40 (remainder 206 40))
;;                 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; ->
;; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;     (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;                     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))  ;; remainder 7
;; ->
;; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))  ;; remainder 4
;; ->
;; final result: 2
;; times of remainder operations performed: 1 + 2 + 4 + 7 + 4 = 18

;; illustrate the process in applicative-order evaluation
;; For each function, evaluate each arguments firstly. After that, apply substitution model(arguments -> parameters).
;; (gcd 206 40)
;; -> sub-rule
;; (if (= 40 0)
;;     206
;;     (gcd 40 (remainder 206 40)))
;; -> if-rule
;; (gcd 40 (remainder 206 40))  ;; remainder 1
;; -> applicative-process-rule
;; (gcd 40 6)
;; -> sub->rule
;; (if (= 6 0)
;;     40
;;     (gcd 6 (remainder 40 6)))
;; -> if-rule
;; (gcd 6 (remainder 40 6))  ;; remainder 1
;; -> applicative-process-rule
;; (gcd 6 4)
;; -> sub-rule
;; (if (= 4 0)
;;     6
;;     (gcd 4 (remainder 6 4)))
;; -> if-rule
;; (gcd 4 (remainder 6 4))  ;; remainder 1
;; -> applicative-process-rule
;; (gcd 4 2)
;; -> sub-rule
;; (if (= 2 0)
;;     4
;;     (gcd 2 (remainder 4 2)))
;; -> if-rule
;; (gcd 2 (remainder 4 2))  ;; remainder 1
;; -> applicative-process-rule
;; (gcd 2 0)
;; -> sub-rule
;; (if (= 0 0)
;;     2
;;     (gcd 0 (remainder 2 0)))
;; -> if-rule
;; 2
;; so, final result: 2
;; times of remainder operations performed: 1 + 1 + 1 = 3

;; We can see that the remainder operations performed in normal-order are mush more than ones performed in applicative-order.
