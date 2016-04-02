(cd "./")
(load "example-list.scm")

(define (scale-list items factor)
  (if (null? items)
      '()
      (cons (* (car items) factor)
	    (scale-list (cdr items) factor))))
;; Test
(display "[Test begin]")
(scale-list (list 1 2 3 4 5) 10)
(display "[Test end]")


(define (map-list proc items)
  (if (null? items)
      '()
      (cons (proc (car items)) (map-list proc (cdr items)))))

;; Test
(display "[Test begin]")
(map-list (lambda (x) (* 10 x)) (list 1 2 3 4 5)) ;Value 72: (10 20 30 40 50)
(map-list abs (list -10 2.5 -11.6 17))
(map-list (lambda (x) (* x x)) (list 1 2 3 4))
;; New definition of scale-list procedure
(define (scale-list-by-map items factor)
  (map-list (lambda (x) (* x factor)) items))
(scale-list-by-map (list 1 2 3 4 5) 10)
(display "[Test end]")
