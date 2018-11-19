#lang racket/base

(require rackunit "1.30.rkt")

(define (identity x) x)
(define (add-one x) (+ x 1))

(check-equal? (sum identity 1 add-one 3) 6)
