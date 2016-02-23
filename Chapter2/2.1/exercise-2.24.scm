(list 1 (list 2 (list 3 4))) ;; (1 (2 (3 4)))

;; 1. the box-and-pointer structure
;;                    ---------    ---------
;; (1 (2 (3 4))) -->  | * | * | -> | * | / |
;;                    ---------    ---------
;;                      |            |
;;                      v            v
;;                      1          ---------    ---------
;;                                 | * | * | -> | * | / |
;;                                 ---------    ---------
;;                                   |            |
;;                                   v            v
;;                                   2
;;                                              ---------    ---------
;;                                              | * | * | -> | * | / |
;;                                              ---------    ---------
;;                                                |            |
;;                                                v            v
;;                                                3            4


;; 2. the interpretation as a tree
;;               (1 (2 (3 4)))
;;                 /       \
;;                1       (2 (3 4))
;;                         /     \
;;                        2      (3 4)
;;                                /  \
;;                               3    4
