#lang racket/base

(require rackunit "2.54.rkt")

(check-equal? (my-equal? '(a b '(c d)) '(a b '(c d))) #t)
(check-equal? (my-equal? '(a b c '(c d)) '(a b '(a b) '(c d))) #f)
(check-equal? (my-equal? '(a '(a) '(b) '(c d)) '(a '(a) '(b) '(c d))) #t)
(check-equal? (my-equal? '(a '(a) '(b) '(c d '())) '(a '(a) '(b) '(c d '(b)))) #f)

