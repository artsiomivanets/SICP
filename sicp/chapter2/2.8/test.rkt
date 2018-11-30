#lang racket/base

(require rackunit "2.8.rkt")

(check-equal? (sub-interval (make-interval 3 5)
                            (make-interval 1 6)) (make-interval -3 4))
