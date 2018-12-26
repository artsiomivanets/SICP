#lang racket/base

(require rackunit "2.40.rkt")

(check-equal? (unique-pairs 3) (list (list 2 1) (list 3 1) (list 3 2)))
(check-equal? (prime-sum-pairs 3) (list (list 2 1 3) (list 3 2 5)))
