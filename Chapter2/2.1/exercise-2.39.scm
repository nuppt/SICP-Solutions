(load "exercise-2.38.scm")

(define (reverse-fr sequence)
  (fold-right (lambda (x y) (cons x y)) nil sequence))


;; Test
(display "Test reverse-fr")
(reverse-fr (list 1 2 3))
(display "Test End")


(define (reverse-fl sequence)
  (fold-left (lambda (x y) (append x (list y))) nil sequence))

(display "Test reverse-fl")
(reverse-fl (list 1 2 3))
(display "Test End")
