(cd "./")
(load "exercise-2.42.scm")

(define (queens-wrong board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter (lambda (positions) (safe? k positions))
		(flatmap (lambda (new-row)
			   (map (lambda (rest-of-queens)
				  (adjoin-position new-row k rest-of-queens))
				(queen-cols (- k 1))))
			 (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

(queens-wrong 1)
(queens-wrong 2)
(queens-wrong 3)
(queens-wrong 4)
(queens-wrong 5)
(queens-wrong 6)
(queens 6)

;; Have been hard to calculate when the number of queens reached 8.
(queens-wrong 8)

;; Explanation

;; Orginal Idea (but wrong)
;; As we can see, after interchange, the expression (flatmap ...) can give us the right result of (queen-cols k).
;; But it computes for a very longer time. The orginal reason is that to compute (flatmap ...),
;; we must compute (queen-cols k-1) repeatedly in board-size times.
;; So, it wastes a lot of vain computation.

;; Let's try to analyze in quantification.
;; In Louis program:
;; For each k = 0..boardsize, the executed steps of (queen-cols k) is S(k), then
;; S(k) = board-size * S(k-1)
;; ...
;; S(0) = 1
;; So, S(k) = board-size^k
;; So, all executing steps of queens-cols of Louis's program is S(0) + S(1) + ... + S(board-size)


;; In Exercise-2.42 program:
;; For each k = 0.. board-size, the executed steps of (queen-cols k) is S'(k), then
;; S'(k) = S'(k-1)
;; ...
;; S'(1) = board-size
;; So, S'(k) = board-size
;; So, all executing steps of queens-cols is S(0) + S(1) + ... + S(board-size)
;;
;; Now, we can estimate that the executing time of queens-wrong is
;;
;;                               Sum(board-size^k / boardsize) * T.
