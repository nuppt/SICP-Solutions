(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(load "example-sequences-as-conventional-interfaces.scm")
(define fold-right accumulate)

(display "Test fold-left vs. fold-right")
(fold-left / 1 (list 1 2 3))   ;; (/ (/ (/ 1 1) 2) 3) = (/ (/ 1 2) 3) = (/ 1 6)
(fold-right / 1 (list 1 2 3))  ;; (/ 1 (/ 2 (/ 3 1))) = (/ 1 (/ 2 3)) = (/ 3 2)
(fold-left list nil (list 1 2 3))  ;Value 22: (((() 1) 2) 3)
(fold-right list nil (list 1 2 3)) ;Value 23: (1 (2 (3 ())))
(display "We can see that fold-left is not equal to fold-right logcially.")
(display "Test End")


;; For a list L: a1 a2 a3 ... an,
;; The procedure fold-left will produce a format:
;;    (op ((op (op (op initial a1) a2) a3) ...) an)
;; It means that to compute fold-left on L, we can firstly do (op initial a1) --- marked as b1.
;; than do (op b1 a2) --- marked as b2
;; continue this process of iteration... until the end of list.

;; The procedure fold-right will produce a format:
;;    (op a1 (op a2 (op a3 (... (op an initial) ...))))
;; It means that to compute fold-right on L, we can firstly do (op an initial) --- marked as bn.
;; than do (op an-1 bn) --- marked as bn-1
;; continue this process of iteration... until the beginning of list.

;; So if we want that fold-right and fold-left produce the same values for any sequence,
;; 1. op must satisfy "Commutativity". That means
;; (op a b) = (op b a)
;; 2. op also must satisfy "associativity". That means
;; (op (op a b) c) = (op a (op b c))
;; Under these properties, we can easily transform between both formats.
