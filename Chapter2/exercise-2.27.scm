(cd "./")
(load "example-list.scm")
(define (deep-reverse l)
  (cond ((not (pair? l)) l)  ;; leaf-node
	(else (reverse (map deep-reverse l)))))  ;; internal-node

(define x (list (list 1 2) (list 3 4 5 6)))
x
(reverse x)
(deep-reverse x)
