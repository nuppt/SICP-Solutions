;; define new make-account procedure with password authentication
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (desposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'desposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
  (define (call-the-cops)
    (error "Warning: some one attempts to hack into system!"))

  (let ((times 0))
    (lambda (pw m)
      (if (eq? pw password)
          (begin (set! times 0)
                 (dispatch m))
          (begin (set! times (+ times 1))
                 (if (< times 7)
                     (error "Incorrect password")
                     (call-the-cops)))))))

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
;; 60
((acc 'some-other-password 'deposit) 50)
;; "Incorrect password"
