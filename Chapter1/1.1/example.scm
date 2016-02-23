;; The advantages of (operator operand1 operand2 ...)
;; No1: arbitrary number of arguments
(+ 21 35 12 7) ; four arguments

(* 25 4 12) ; three arguments

;; No2: easy way to allow combinations to benested
(+ (* 3 5) (- 10 6))

;; Format the complex expression properly to display pretty for human's reading
; before formating
(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))  ; = 57
; after formating
(+ (* 3
      (+ (* 2 4)
	 (+ 3 5)))
   (+ (- 10 7)
      6))

;; Naming 命名
;; Using names to refer to computational objects,
;; The name identifies a variable whose value is the object.

; define a variable named 'size',
; it refers to a computational object, which is a numeral '2',
; and we also can say that the value of variable 'size' is the object '2'.
(define size 2)
; If we want to get the object '2', we can just refer to it by the name of variable:
; read the value of size, the interpreter can print its value for us.
size ; 2
(* 5 size) ; 10

; an example of the use of 'define'
(define pi 3.14159)
(define radius 10)
(* pi (* radius radius)) ; the area of circle whose radius is 10
; We can find in 'define', the value of variable can be initialized with an expression:
; Here, name 'circumference', refers to the object '(* 2 pi radius)'.
; In another way to see, it is a mean of abstraction: 
(define circumference (* 2 pi radius))
circumference



;; Tree representation for combination (recursively)
;;           390
;;      /    |      \
;;     *    26       15
;;       /  |  \    / | \ \
;;      +   2 24   +  3 5 7
;;           / | \
;;          *  4 6
(* (+ 2 (* 4 6))
   (+ 3 5 7))


;; learning case analysis
;; Syntax:
;;   (cond (<p1> <e1>)
;;         (<p2> <e2>)
;;         ...
;;         (<pn> <en>))
;; 类似C语言的switch case语句 (缺少default case)
(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))

(abs 5)
(abs 0)
(abs (- 5))

;; Syntax:
;;   (cond (<p1> <e1>)
;;         (<p2> <e2>)
;;         ...
;;         (else <e2>))
;; 类似C语言的switch case语句，else对应default case
(define (abs1 x)
  (cond ((< x 0) (- x))
	(else x)))

(abs1 5)
(abs1 0)
(abs1 (- 5))

;; Syntax:
;;   (if <p> <e1> <e2>)
;; 类似C语言中的if语句(没有else分句)
(define (abs2 x)
  (if (< x 0)
      (- x)
      x))
(abs2 5)
(abs2 0)
(abs2 (- 5))

;; 类似C语言中的if语句(通过层次嵌套，在alternative中继续使用if语句，可以获得
;; if-then-else的实现)
;; 把(if <p> <e1> <e2>)作为e2的argument，继续apply。
(define (abs3 x)
  (if (< x 0)
      (- x)
      (if (= x 0)
	  0
	  x)))
(abs3 5)
(abs3 0)
(abs3 (- 5))


;; logic operations :
;; 1. and
;; 2. or
;; 3. not
;;
;; The value of x:bool is #t/#f.

(define x 7)
(and (> x 5) (< x 10))



;; Procedual abstraction
;; 两个功能相同的过程，从外部来看，它们没有任何区别。
(define (square1 x)
  (* x x))
(define (double x)
  (+ x x))
(define (square2 x)
  (exp (double (log x))))

(square1 2)
(square2 2)

(square1 2.3)
(square2 2.3)


(define (sqrt x)
  (define (square x)
    (* x x))
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
  
  (sqrt-iter 1.0 x))

(sqrt 1)
(sqrt 2)
(sqrt 3)
(sqrt 4)
(sqrt 5)
(sqrt 6)
(sqrt 7)
(sqrt 10000000)

;; x is bound variable in sqrt1
(define (sqrt1 x)
  (define (square x)
    (* x x))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
	guess
	(sqrt-iter (improve guess))))
  
  (sqrt-iter 1.0))
(sqrt1 3)
