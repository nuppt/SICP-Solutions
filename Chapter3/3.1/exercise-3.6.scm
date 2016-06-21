;; reset random generator
;; two options:
;; 1. 'generate
;; 2. 'reset (with <new-value>)
(define (rand-update x)
  (let ((a (expt 2 32))
        (c 1103515245)
        (m 12345))
    (modulo (+ (* a x) c) m)))
(define rand-init 0)
(define new-rand
  (let ((x rand-init))
    (define (dispatch op)
      (cond ((eq? op 'generate)
             (begin (set! x (rand-update x))
                      x))
            ((eq? op 'reset)
             (lambda (val)
               (begin (set! x val)
                      x)))
            (else (error "Unknown Op:NEW-RAND" op))))
    dispatch))

;; test
(new-rand 'generate)
((new-rand 'reset) 11820)
(new-rand 'generate)
