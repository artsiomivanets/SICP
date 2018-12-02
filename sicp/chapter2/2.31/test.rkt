#lang racket/base

(require rackunit "2.31.rkt")

(define actual-list (list 2 (list 3) 2 (list (list 5))))
(define expected-list (list 4 (list 9) 4 (list (list 25))))

(check-equal? (square-tree actual-list) expected-list)
