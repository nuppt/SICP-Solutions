(define (cont-frac n d k)
  (define (next x) (+ x 1))
  (define (iter i)
    (if (= i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i) (iter (next i))))))
  (iter 1))


;; simple test
(let ((k 10))
  (cont-frac (lambda (i) 1.0)
	     (lambda (i) 1.0)
	     k))  ;Value: .6179775280898876
(let ((k 100))
  (cont-frac (lambda (i) 1.0)
	     (lambda (i) 1.0)
	     k))  ;Value: .6180339887498948


;; compute how large of k be made to get an approximation that is accurate to
;; 4 decimal places
;; 1/phi = 2 / (1 + sqrt(5))
(define tolerance 0.0001)
(define 1-div-phi (/ 2 (+ 1 (sqrt 5))))
(define (cont-frac-find-min-k-to-get-4-decimal-places n d)
  (define (next x) (+ x 1))
  (define (close-enough? a b) (< (abs (- a b)) tolerance))

  ;; check the difference of (fraction k) and 1-div-phi
  (define (iter k)
    (define (fraction k)
      (cont-frac n d k))
    (if (close-enough? (fraction k) 1-div-phi)
	k
	(iter ((lambda (x) (+ x 1)) k))))
  (iter 1))
(cont-frac-find-min-k-to-get-4-decimal-places (lambda (i) 1.0)
					      (lambda (i) 1.0))  ;Value: 10
;; so, the min of k is 10


;; my cont-frac procedure above generates a recursive process
;; now, below is a iterative version
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
	result
	(iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))
;; test
;; simple test
(let ((k 10))
  (cont-frac-iter (lambda (i) 1.0)
		  (lambda (i) 1.0)
		  k))  ;Value: .6179775280898876
(let ((k 100))
  (cont-frac-iter (lambda (i) 1.0)
		  (lambda (i) 1.0)
		  k))  ;Value: .6180339887498948
