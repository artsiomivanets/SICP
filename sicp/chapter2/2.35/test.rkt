#lang racket/base

(require rackunit "2.35.rkt")

(check-equal? (count-leaves (list 1 (list 3 (list 5)))) 3)
(check-equal? (count-leaves (list 2 (list 3 (list 5) (list 1)) (list 1 (list 1)))) 6)
