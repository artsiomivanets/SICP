#lang racket/base

(require rackunit "2.27.rkt")

(check-equal? (deep-reverse (list (list 1 2)
                                  (list 3 4)
                                  (list (list 5 6)
                                        (list 7 8))))
              (list (list (list 8 7)
                          (list 6 5))
                    (list 4 3)
                    (list 2 1)))

(define x (list (list 1 2) (list 3 4)))
(check-equal? (deep-reverse x) (list (list 4 3) (list 2 1)))
