#lang racket/base

(require rackunit "2.23.rkt")

(check-equal? (my-for-each (lambda (x) (display x)) (list 2 3 4)) #t)
