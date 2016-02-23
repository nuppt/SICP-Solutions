(cd "./")
(load "example-list.scm")

;;
;;  Learn how to define a procedure with arguments in nondeteministic numbers.
;;

(define (f x y . z)
  (display "the number of arguments of f: ")
  (+ 2 (length z))) ;; right
(f 1 2 3 4 5 6) ; x = 1, y = 2, z = (list 3 4 5 6)

;; definition of f is wrong because there are more than one parameter after dot.
;; (define (f x y . z w) ()) ;Ill-formed dotted list: (f x y |.| z w)

;; Test
(f)     ;The procedure #[compound-procedure 26 f] has been called with 0 arguments; it requires at least 2 arguments.
(f 0)   ;The procedure #[compound-procedure 26 f] has been called with 1 argument; it requires at least 2 arguments.
(f 0 0) ;Value: 2
;; ...
;; f can only be called with two or more arguments
;; End

;; Similarly, we can define a procedure, which can be called
;; by arguments in arbitrary number.
(define (g . w)
  (display "the number of arguments of g: ")
  (length w))
;; Test
(g)     ;Value: 0
(g 0)   ;Value: 1
(g 0 1) ;Value: 2
;; End

(define (same-parity . l)
  (define (hd l)
    (if (null? l)
	'()
	(car l)))
  (define (iter x l result)
    (if (null? l)
	result
	(if (= (remainder x 2) (remainder (car l) 2))
	    (iter x (cdr l) (append result (list (car l))))
	    (iter x (cdr l) result))))

  (if (null? l)
      (list)  ;; (list) means initilize a list without any values, namely empty list.
      (iter (hd l) l (list))))
(same-parity 1 2 3 4 5 6 7)  ;Value 71: (1 3 5 7)
(same-parity 2 3 4 5 6 7)    ;Value 70: (2 4 6)
(same-parity 1)              ;Value 69: (1)
(same-parity)                ;Value: ()
