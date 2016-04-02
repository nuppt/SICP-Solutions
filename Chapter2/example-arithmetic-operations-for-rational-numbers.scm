;; In theory,
;; constructor of rational numbers
;;   (make-rat <n> <d>)
;; selectors of rational numbers
;;   1. the numerator of the rational number x
;;   (numer <x>)
;;   2. the denominator of the rational number x
;;   (denom <x>)
;;
;; rules of computing arithmetic operations for rational numbers
;;   1. add
;;   n1     n2     n1d2 + n2d1
;;   --  +  --  =  -----------
;;   d1     d2         d1d2
;;   2. subtract
;;   n1     n2     n1d2 - n2d1
;;   --  -  --  =  -----------
;;   d1     d2         d1d2
;;   3. multiply
;;   n1     n2     n1n2
;;   --  *  --  =  ----
;;   d1     d2     d1d2
;;   4. divide
;;   n1     n2     n1d2
;;   --  /  --  =  ----
;;   d1     d2     n2d1
;;   5. test-equality
;;   n1     n2
;;   --  =  --  <=>  n1d2 = n2d1
;;   d1     d2

;; In practice, we can describe type of rational-number and all operations on it as follows.

;; Basic definition for type
(define (make-rat n d)
  (cons n d))
(define (numer x)
  (car x))
(define (denom x)
  (cdr x))
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;; Test
(define one-half (make-rat 1 2))
(print-rat one-half)
;; End


;; Additional definition for operations
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (numer y) (denom x))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;; Test
(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
(print-rat (sub-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-third one-third))  ;; 6/9 (not the lowest term: 2/3)
;; End


(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

;; Test
(print-rat (add-rat one-third one-third))  ;; 2/3
(print-rat (sub-rat one-third one-half))   ;; -1/6
(print-rat (make-rat -1 -6))  ;; -1/-6
;; End
