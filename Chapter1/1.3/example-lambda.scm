((lambda (x) (+ x 4)) 3)

((lambda (x) (/ 1.0 (* x (+ x 2)))) 4)

((lambda (x y z) (+ x y (square z))) 1 2 3)

(define (f1 x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
	    (- 1 y)))

(define (f2 x y)
  ((lambda (a b)
     (+ (* x (square a))
	(* y b)
	(* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (f3 x y)
  (let ((a (+ 1 (* x y)))
	(b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

;; same value: 8420766
(f1 15 50)
(f2 15 50)
(f3 15 50)



;; when x = 5, value of expression below is 38.
;; note: last x is 5, value of x in let expression is 3.
((lambda (x)
   (+ (let ((x 3))
	 (+ x (* x 10)))
       x)) 5)

;; same as f3
(define (f4 x y)
  (define a (+ 1 (* x y)))
  (define b (- 1 y))
  (+ (* x (square a))
     (* y b)
     (* a b)))
(f4 15 50) ;Value: 8420766
