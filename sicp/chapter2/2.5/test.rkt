#lang racket/base

(require rackunit "2.5.rkt")

(check-equal? (my-car (my-cons 2 3)) 2)
(check-equal? (my-car (my-cons 5 8)) 5)
(check-equal? (my-car (my-cons 0 3)) 0)
(check-equal? (my-car (my-cons 1 1)) 1)

(check-equal? (my-cdr (my-cons 2 3)) 3)
(check-equal? (my-cdr (my-cons 4 1)) 1)
(check-equal? (my-cdr (my-cons 4 0)) 0)
(check-equal? (my-cdr (my-cons 4 10)) 10)
