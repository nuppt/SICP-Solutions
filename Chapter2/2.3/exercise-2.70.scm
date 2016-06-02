(cd "./")
(load "exercise-2.69.scm")
(load "exercise-2.68.scm")

(define alphabet
  (list '(A 2)
        '(GET 2)
        '(SHA 3)
        '(WAH 1)
        '(BOOM 1)
        '(JOB 2)
        '(NA 16)
        '(YIP 9)))

(define huffman-tree-example
  (generate-huffman-tree alphabet))

(define msg
  '(Get a job
        Sha na na na na na na na na
        Get a job
        Sha na na na na na na na na
        Wah yip yip yip yip yip yip yip yip yip
        Sha boom))
(encode msg huffman-tree-example) ;; (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 0)
(length (encode msg huffman-tree-example))  ;; 84
(define msg-code
  '(1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 0))
(decode msg-code huffman-tree-example)  ;; (get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom)

;; 1. So, there are 84 bits required for the encoding.

;; 2. fixed-length code for the eight-symbol alphabet
;; We need 3 bits to encode each symbol:
;; A    000
;; GET  001
;; SHA  010
;; WAH  011
;; BOOM 100
;; JOB  101
;; NA   110
;; YIP  111

(* 3 (length msg))  ;; 108
;; So, there are 108 bits required for the fixed-length coding.
