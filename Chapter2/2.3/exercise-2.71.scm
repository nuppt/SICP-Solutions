;; alphabet
;; s0, 2^0
;; s1, 2^1
;; s2, 2^2
;; ...
;; sn-1, 2^(n-1)
;;
;; Lemma: forall n. sum(2^0 + 2^1 + ... + 2^(n-1)) = 2^n - 1.
;;
;; So, we know that the structure of huffman tree is as follows:
;;
;;          { s0, s1, s2, ..., sn-1 }, 2^n - 1
;;         /                         \
;;   sn-1, 2^(n-1)          { s0, s1, s2, ..., sn-2 }, 2^(n-1) - 1
;;                         /                         \
;;                   sn-2, 2^(n-2)         { s0, s1, s2, ..., sn-3 }, 2^(n-2) - 1
;;                                                   ......
;;                                                      \
;;                                                { s0, s1, s2 }, 7
;;                                               /               \
;;                                           s2, 4             { s0, s1 }, 3
;;                                                            /           \
;;                                                        s1, 2          s0, 1
;;
;; Q1: bits requires to encode the most frequent symbol 'sn-1'
;; A1: We can obtain the solution from the huffman tree, the code of sn-1 is '0', so it just needs 1 bit for sn-1.
;;
;; Q2: bits requires to encode the most frequent symbol 's0'
;; A2: Similiar with Q1, the code of s0 is '1...1', which has n-1 '1', so it just needs n-1 bits for s0.
