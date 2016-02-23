(define x (list 1 2 3))
(define y (list 4 5 6))

;; list<T> -> list<T> -> list<T>
(append x y)  ;; (1 2 3 4 5 6)

;; Note: (cons x (list a1 a2 ...)) = (list x a1 a2 ...) as x is a independent element,
;; no matter what type is x
(cons x y)    ;; ((1 2 3) 4 5 6)

;; just build a list of two separate elements
(list x y)    ;; ((1 2 3) (4 5 6))
