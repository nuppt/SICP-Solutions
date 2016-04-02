(define (print . args)
  (display args))

(define (print-newline l)
  (map (lambda (x) (display x) (newline)) l))
