(load "example-sequences-as-conventional-interfaces.scm")

(define (signal-flow-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
	      nil
	      sequence))
(signal-flow-map square (list 1 2 3 4 5))  ;Value 27: (1 4 9 16 25)


(define (signal-flow-append seq1 seq2)
  (accumulate cons
	      seq2
	      seq1))
(signal-flow-append (list 1 2 3) (list 4 5 6)) ;Value 32: (1 2 3 4 5 6)
(signal-flow-append (list 4 5 6) (list 1 2 3)) ;Value 33: (4 5 6 1 2 3)


;; (op 1 (op 2 (op 3 (op 4 (op 5 0)))))
(define (signal-flow-length sequence)
  (accumulate (lambda (x y) (+ 1 y))  ;; just represent each x by 1
	      0
	      sequence))
(signal-flow-length (list 1 2 3 4 5)) ;Value: 5
(signal-flow-length (list 9 3 4 5))   ;Value: 4
