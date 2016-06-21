(define (make-accumulator init-state)
  (lambda (x)
    (begin (set! init-state (+ init-state x))
           init-state)))


;; Test
(define A (make-accumulator 5))
(A 10)
;; 15
(A 10)
;; 25
