(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else (+ (cc amount
		     (- kinds-of-coins 1))
		 (cc (- amount
			(first-denomination kinds-of-coins))
		     kinds-of-coins)))))

;; US coins
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))

;;; UK coins
;(define (first-denomination kinds-of-coins)
;  (cond ((= kinds-of-coins 1 ) 1)
;        ((= kinds-of-coins 2 ) 2)
;        ((= kinds-of-coins 3 ) 5)
;        ((= kinds-of-coins 4 ) 10)
;        ((= kinds-of-coins 5 ) 20)
;        ((= kinds-of-coins 6 ) 50)
;        ((= kinds-of-coins 7 ) 100)
;        ((= kinds-of-coins 8 ) 200)))

(count-change 11)

;; Orders of growth of the space and number of steps used by this process
;; cc是一个递归函数，以扩展树(extend-tree)的形式来分析orders-of-growth-of-space和number-of-steps
;; 其中，tree的深度是orders-of-growth-of-space，tree的所有节点是number-of-steps
