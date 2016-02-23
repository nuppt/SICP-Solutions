(define (f g) (g 2))
(f square)  ; 4
(f (lambda (z) (* z (+ z 1))))  ; 6


(f f)
;; Explain:
;; (f f) ->
;; (f 2) ->
;; (2 2) ; stuck, scheme interpreter will report error message by saying ";The object 2 is not applicable."
