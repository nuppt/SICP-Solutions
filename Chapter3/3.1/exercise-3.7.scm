(load "exercise-3.3.scm")

(define (make-joint account old-password new-password)
  (lambda (password msg)
    (if (eq? password new-password)
        (account old-password msg)
        (error "Invalid password:MAKE-JOINT"))))

;; Test
(define peter-acc
  (make-account 100 'open-sesame))
(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))
((peter-acc 'open-sesame 'withdraw) 10)  ;; 90
((paul-acc 'rosebud 'withdraw) 10)       ;; 80
((paul-acc 'open-sesame 'withdraw) 10)   ;; Invalid password:MAKE-JOINT
