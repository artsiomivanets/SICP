#lang racket/base

(require rackunit "1.16.rkt")

(check-equal? (fast-exp 2 8) 256)
(check-equal? (fast-exp 3 9) 19683)
