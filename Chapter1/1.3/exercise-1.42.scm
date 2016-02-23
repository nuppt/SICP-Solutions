;; functions f and g are arguments of function compose
;; the return value of compose is a new function
(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ 1 x))

((compose square inc) 6) ;Value: 49
