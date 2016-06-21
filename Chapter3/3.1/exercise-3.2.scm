(define (make-monitored f)
  (define counter 0)
  (lambda (x)
    (cond ((eq? x 'how-many-calls?) counter)
          ((eq? x 'reset-count) (begin (set! counter 0)
                                       counter))
          (else (begin (set! counter (+ counter 1))
                       (f x))))))

;; Test
(define s (make-monitored sqrt))  ;; s is an object with monitor
(s 100)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)
