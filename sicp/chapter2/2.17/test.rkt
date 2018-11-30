#lang racket/base

(require rackunit "2.17.rkt")

(check-equal? (last-pair (list 1 2 3 4 5)) 5)
(check-equal? (last-pair-iter (list 11 2 34 4 6)) 6)
