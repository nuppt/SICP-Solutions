(cd "./")
(load "example-list.scm")
(load "example-sequences-as-conventional-interfaces.scm")
(load "example-nested-mapping.scm")
(load "../../lib.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter (lambda (positions) (safe? k positions))
		(flatmap (lambda (rest-of-queens)
			   (map (lambda (new-row)
				  (adjoin-position new-row k rest-of-queens))
				(enumerate-interval 1 board-size)))
			 (queen-cols (- k 1))))))
  (queen-cols board-size))

(define nil '())
(define empty-board nil)
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define pair cons)

;; Type:
;;   k: Integer
;;   positions: List Integer
;; safe? Integer -> List Integer -> Bool
(define (safe? k positions)
  (define row-of-new-queen (car positions))
  (define row-of-rest-queens (cdr positions))
  (define (iter-check new-queen rest-queens step)
    (if (null? rest-queens)
	true
	(let ((current-queen (car rest-queens)))
	  (if (or (= new-queen current-queen)
		  (= new-queen (+ current-queen step))
		  (= new-queen (- current-queen step)))
	      false
	      (iter-check new-queen (cdr rest-queens) (+ step 1))))))
  (iter-check row-of-new-queen row-of-rest-queens 1))


;; Test
;; print in list format
(queens 4)
(print-newline (queens 8))

;; print in graph
(define (draw-queens queens)
  (newline)
  (define (iter-draw queens len i)
    (if (> i len)
	(newline)
	(and (map (lambda (x) (if (= x (car queens))
			      (display "*")
			      (display "-")))
		  (enumerate-interval 1 len))
	     (newline)
	     (iter-draw (cdr queens) len (+ i 1)))))
  (iter-draw queens (length queens) 1))

;; (draw-queens (list 5 7 2 6 3 1 4 8))  ;; test
(map draw-queens (queens 4))
(map draw-queens (queens 8))
;; End
