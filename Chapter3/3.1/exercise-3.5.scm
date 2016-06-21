(load "example-the-benefits-of-introducing-assignment.scm")

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (point-is-in-region? x1 x2 y1 y2)
  (let ((x (random-in-range x1 x2))
        (y (random-in-range y1 y2))
        (r (/ (- x2 x1) 2))
        (ox (/ (+ x1 x2) 2))
        (oy (/ (+ y1 y2) 2)))
    (<= (+ (square (- x ox))
           (square (- y oy)))
        (square r))))

;; P： 采样函数
;; 左下角点： <x1, y1>； 右上角点： <x2, y2>
;; trials： 采样次数
(define (estimate-integral P x1 x2 y1 y2 trials)
  ;; 采样函数
  (define (experiment)
    (P x1 x2 y1 y2))
  (monte-carlo trials experiment))

;; 实验估算结果 := 掉入目标region的次数 / 总实验次数
(estimate-integral point-is-in-region? 2.0 4.0 8.0 10.0 1000)
;; 估算pi
(* 4 (estimate-integral point-is-in-region? 2.0 4.0 8.0 10.0 1000))
