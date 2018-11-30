#lang racket/base

(require rackunit "2.20.rkt")

(check-equal? (same-parity 2 3 1 6 8 10 11) (list 2 6 8 10))
(check-equal? (same-parity 1 3 5 6 8 10 11) (list 1 3 5 11))
