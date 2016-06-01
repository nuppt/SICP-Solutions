(define (print . args)
  (display args))

(define (print-newline l)
  (map (lambda (x) (display x) (newline)) l))



;; Very simple type checking for an object
;; May helpful somewhere, for example, when I'm not sure of the type of an object.
(define get-Type
  (lambda (x)
    (cond ((number? x) "Number")
	  ((pair? x) "Pair")
	  ((string? x) "String")
	  ((list? x) "List")
	  (else "Unknown type"))))
