(cd "./")
(load "example-mapping-over-lists.scm")

;; proc(items[0]), proc(items[1]), ...
;; tip: this can be implemented by cond rather than if-structure.
(define (for-each proc items)
  (cond ((null? items) true)
	(else (proc (car items))
	      (for-each proc (cdr items)))))

(for-each (lambda (x)
	    (newline)
	    (display x))
	  (list 57 321 88))
