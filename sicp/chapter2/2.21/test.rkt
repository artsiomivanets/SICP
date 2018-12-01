#lang racket/base

(require rackunit "2.21.rkt")

(check-equal? (square-list (list 2 3 4)) (list 4 9 16))
(check-equal? (map-square-list (list 2 3 4)) (list 4 9 16))
