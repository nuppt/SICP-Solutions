;; i + j + k = s &&
;; 0 < i <= n &&
;; 0 < j <= n &&
;; 0 < k <= n &&
;; => (list i j k)
(load "example-nested-mapping.scm")

(define (unique-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k) (list i j k))
			     (enumerate-interval 0 (- n 1))))
		      (enumerate-interval 0 (- n 1))))
	   (enumerate-interval 0 (- n 1))))

(define (sum-of-triple triple)
  (if (null? triple)
      0
      (+ (car triple) (sum-of-triple (cdr triple)))))

(define (make-triple-sum triple)
  (append triple (list (sum-of-triple triple))))

(define (gen-triples n s)
  (map make-triple-sum
       (filter (lambda (t) (= (sum-of-triple t) s))
	       (unique-triples n))))

;; Test
(unique-triples 3)
(make-triple-sum (list 1 2 3))
(sum-of-triple (list 1 2 3))
(gen-triples 4 5) ;Value 35: ((0 2 3 5) (0 3 2 5) (1 1 3 5) (1 2 2 5) (1 3 1 5) (2 0 3 5) (2 1 2 5) (2 2 1 5) (2 3 0 5) (3 0 2 5) (3 1 1 5) (3 2 0 5))
;; End
