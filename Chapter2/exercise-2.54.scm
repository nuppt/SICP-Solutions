(load "/Users/yangchen/Code_Set/Github/nuppt/SICP/lib.scm")
;; Definition of equal?
;; Function: check two reference of symbol is equal or not
(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
	((and (not (null? a)) (null? b)) false)
	((and (null? a) (not (null? b))) false)
	(else (and (if (and (number? (car a))
			    (number? (car b))) ;; if (car a) and (car b) is both number, use '=', else use 'eq?'
		       (= (car a) (car b))
		       (eq? (car a) (car b)))
		   (equal? (cdr a) (cdr b))))))

;; Test
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '(this is abc) '(this is xyz))


;; Because 1~3 all are list, which is constructed by pair type.
(get-type '(this is a list))  ;; Pait
(get-type '(this (is a) list))  ;; Pair
(get-type '(abc xyz))  ;; Pair
(get-type 'abc)  ;; Unknown type
