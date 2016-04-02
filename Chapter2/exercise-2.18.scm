(cd "./")
(load "exercise-2.17.scm")

(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))
(reverse (list 1 4 9 16 25))
