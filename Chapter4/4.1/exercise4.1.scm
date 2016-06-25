(load "core-of-the-evaluator.scm")

;; order: left -> right
(define (list-of-values-l-order exps env)
  (if (no-operands? exps)
      '()
      (let ((first-value (eval (first-operand exps) env))
            (rest-values (list-of-values-l-order (rest-operands exps) env)))
        (cons first-value rest-values))))

;; order: right -> left
(define (list-of-values-r-order exps env)
  (list-of-values-l-order (reverse exps) env))
