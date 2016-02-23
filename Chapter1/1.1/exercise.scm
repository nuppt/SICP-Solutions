;; Exercise 1.1
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)

(if (and (> b a) (< b (* a b)))
    b
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))

;; Exercise 1.2
(/ (+ 5 4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))  ;; -37/150

;; Exercise 1.3
(define (fun1.3 x y z)
  (cond ((>= x y)
	 (cond ((>= y z) (+ x y))
	       (else (+ x z))))
	(else (cond ((>= x z) (+ x y))
		    (else (+ y z))))))
(fun1.3 1 2 3) ;; 5
(fun1.3 3 3 2) ;; 6
(fun1.3 4 10 2) ;; 14

;; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; (+ a (abs b)) :=
;;   if b > 0 then (+ a b)
;;            else (- a b) = (+ a (-b))
;;

;; Exercise 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; If the interpreter uses applicative-order evaluation,
;; The evaluating process of expression (test 0 (p)) is as follows:
;;   S1: Eval the arguments [0, (p)], 0 is primitive element,
;;       (p) is extend as (p) by defintion;
;;   S2: After that, the format of (test 0 (p)) is (test 0 (p));
;;   S3: Apply the definition of (test x y) expression, there is a transform:
;;       (test 0 (p)) = (if (= 0 0) 0 (p) )
;;   S4: Apply 'if' rule of built-in definition, firstly eval (= 0 0), so
;;       we will get 0 as the result.

;; If the interpreter uses normal-order evaluation,
;; the evaluating process of expression is like
;;   (test 0 (p)) = (test 0 (p))
;; recursively! So we can not get the result because of non-termination.


;; Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (square x)
  (* x x))
(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

;; The execution of following samples stuck and display info like:
;; Aborting!: maximum recursion depth exceeded.
;; The reason is new-if is a procedure, based on the rule of evaluation of function, each parameter should be calculated. So when we use new-if in sqrt-iter, in each iteration, then-clause and else-clause will be evaluated that causes the infinite iteration.

;; On the other hand, if we use if instead, it works.
;; because 'if' has a special rule:
;;   If if-clause is #t, evaluate then-clause,
;;   otherwise evaluate else-clause.
;; So, we can avoid the bad situation with infinite iteration.
(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

;(sqrt 0.00009)
;(sqrt 3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)


;; Exercise 1.8
(define (cube x)
  (* x x x))
(define (cube-good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.000001))
(define (cube-improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (cube-iter guess x)
  (if (cube-good-enough? guess x)
	  guess
	  (cube-iter (cube-improve guess x) x)))
(define (cube-root x)
  (cube-iter 1.0 x))

(cube-root 8)
(cube-root 1000)
(cube-root 0.001)
(cube-root 1000000000000000000000000000000000000000000000000000000)
