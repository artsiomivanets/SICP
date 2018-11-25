#lang racket/base

(require rackunit "2.4.rkt")

(check-equal? (my-car (my-cons 2 3)) 2)
(check-equal? ((my-car (my-cons (lambda (x) x) 3)) 3) 3)
