(cd "~/Code_Set/Github_of_nuppt/SICP/Chapter1/1.2/")
(load "9-inc.scm")
(load "9-dec.scm")

;; The recursive process of calculating (plus 4 5)
;; (inc (plus (dec 4) 5))
;; (inc (plus 3 5))
;; (inc (inc (plus (dec 3) 5)))
;; (inc (inc (plus 2 5)))
;; (inc (inc (inc (plus (dec 2) 5))))
;; (inc (inc (inc (plus 1 5))))
;; (inc (inc (inc (inc (plus (dec 1) 5)))))
;; (inc (inc (inc (inc (plus 0 5)))))
;; (inc (inc (inc (inc 5))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; 9
(define (plus_rec a b)
  (if (= a 0)
      b
      (inc (plus_rec (dec a) b))))

(plus_rec 0 5)
(plus_rec 1 5)
(plus_rec 2 5)
(plus_rec 3 5)
(plus_rec 4 5)




;; The iterative process of calculating (plus 4 5)
;; (plus 4 5)
;; (plus (dec 4) (inc 5))
;; (plus 3 6)
;; (plus (dec 3) (inc 6))
;; (plus 2 7)
;; (plus (dec 2) (inc 7)
;; (plus 1 8)
;; (plus (dec 1) (inc 8))
;; (plus 0 9)
;; 9
(define (plus_itr a b)
  (if (= a 0)
      b
      (plus_itr (dec a) (inc b))))
(plus_itr 0 5)
(plus_itr 1 5)
(plus_itr 2 5)
(plus_itr 3 5)
(plus_itr 4 5)
