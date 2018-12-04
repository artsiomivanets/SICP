#lang racket/base

(require rackunit "2.36.rkt")

(check-equal? (accumulate-n + 0(list (list 1 1 1) (list 2 2 2) (list 3 3 3))) (list 6 6 6))
