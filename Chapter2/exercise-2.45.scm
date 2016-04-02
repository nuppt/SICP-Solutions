(define (split combiner1 combiner2)
  (define (split-generator painter n)
    (if (= n 0)
	painter
	(let ((smaller (split-generator painter (- n 1))))
	  (combiner1 painter (combiner2 smaller smaller)))))
  split-generator)

(define (right-split (split beside below)))
(define (up-split (split below beside)))
