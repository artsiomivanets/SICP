#lang racket/base

(require rackunit "1.3.rkt")

(check-equal? (two-max-squares 2 3 4) 25)
(check-equal? (two-max-squares 4 2 4) 32)
(check-equal? (two-max-squares 5 5 2) 50)
