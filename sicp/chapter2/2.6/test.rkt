#lang racket/base

(require rackunit "2.6.rkt")

(check-equal? (((add-one zero) (lambda (x) (+ 1 x))) 0) 1)
(check-equal? (((add-one one) (lambda (x) (+ 1 x))) 0) 2)
(check-equal? (((add-one two) (lambda (x) (+ 1 x))) 0) 3)
