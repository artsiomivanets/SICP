#lang racket/base

(require rackunit "2.18.rkt")

(check-equal? (reverse-iter (list 5 3 6 1)) (list 1 6 3 5))
(check-equal? (my-reverse (list 5 3 6 1)) (list 1 6 3 5))
