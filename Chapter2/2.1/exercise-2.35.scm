(load "example-sequences-as-conventional-interfaces.scm")
;; if t = list(a1, a2, ... , an)
;; count-leaves(t) = count-leaves(a1) + count-leaves(a2) + ... + count-leaves(an)
;;
(define (count-leaves t)
  (accumulate +
	      0
	      (map (lambda (x) (if (pair? x)
				   (count-leaves x)
				   1)) t)))
(count-leaves (list 1 2 3 4 5))  ;Value: 5
(count-leaves (list 1
		    (list 2
			  (list 3
				(list 4
				      (list 5))))))  ;Value: 5
(count-leaves (list 1 2 3
		    (list 4 5 4 3 2 1)))  ;Value: 9
