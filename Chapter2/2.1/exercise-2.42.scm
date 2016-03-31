(load "./example-list.scm")
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter (lambda (positions) (safe? k positions))
		(flatmap (lambda (rest-of-queens)
			   (map (lambda (new-row)
				  (adjoin-position
				   new-row k rest-of-queens))
				(enumerate-interval 1 board-size)))
			 (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define pair cons)
(define (safe? k positions)
  (map safe-pairs? (queen-pairs-k-with-others k positions)))
(define (queen-pairs-k-with-others k positions)
  (let ((new-queen (pair k (car positions))))
    (map (lambda (q) (pair new-queen q)) (cdr positions))))

(define (safe-pairs? queen-pairs)
  (if (null? queen-pairs)
      true
      (and (safe-pair (car queen-pairs))
	   (safe-pairs? (cdr queen-pairs)))))
(define (safe-pair? two-queens)
  (let ((q1 (car two-queens))
	(q2 (cadr two-queens)))
    (and (not (same-row? q1 q2))
	 (not (same-col? q1 q2))
	 (not (same-dig? q1 q2)))))
(define (same-row? q1 q2)
  (= (car q1) (car q2)))
(define (same-col? q1 q2)
  (= (cdr q1) (cdr q2)))
(define (same-dig? q1 q2)
  (= (abs (- (car q1) (car q2))) (abs (- (cdr q1) (cdr q2)))))


;; Test
(queen-pairs-k-with-others 2 (list 1 3))
;; End
