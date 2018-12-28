#lang racket/base

(require rackunit "2.59.rkt")

(check-equal? (union-set '(a b c) '(d e b)) '(a c d e b))
(check-equal? (union-set '(a b c) '(d e g)) '(a b c d e g))

