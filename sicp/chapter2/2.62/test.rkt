#lang racket/base

(require rackunit "2.62.rkt")

(check-equal? (union-set '(1 5 6 8 9) '(2 4 7 9)) '(1 2 4 5 6 7 8 9))
(check-equal? (union-set '(1 2 3) '(20 30 40)) '(1 2 3 20 30 40))
(check-equal? (union-set '() '()) '())

