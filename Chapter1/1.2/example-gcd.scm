(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 4 10)  ; 2
(gcd 10 10) ; 10
(gcd 3 10) ; 1
