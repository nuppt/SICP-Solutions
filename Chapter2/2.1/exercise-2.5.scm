(define (cons x y)
  (define (exp base n)
    (if (= n 0)
	1
	(* base (exp base (- n 1)))))
  (* (exp 2 x) (exp 3 y)))

(define (car z)
  (define (counter z)
    (if (not (= (remainder z 2) 0))
	0
	(+ 1 (counter (/ z 2)))))
  (counter z))

(define (cdr z)
  (define (counter z)
    (if (not (= (remainder z 3) 0))
	0
	(+ 1 (counter (/ z 3)))))
  (counter z))

;; Test
(define x (cons 1 2))
(car x)
(cdr x)
;; End
