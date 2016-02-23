(load "example-sequences-as-conventional-interfaces.scm")

(define (hd seq) (car seq))
(define (tail seq) (cdr seq))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map hd seqs))
	    (accumulate-n op init (map tail seqs)))))

;; Test Begin
(define seq-of-seqs (list (list 1 2 3)
			  (list 4 5 6)
			  (list 7 8 9)
			  (list 10 11 12)))
(accumulate-n + 0 seq-of-seqs)  ;Value 13: (22 26 30)
;; Test End
