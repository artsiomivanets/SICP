#lang racket/base

(require rackunit "1.21.rkt")

(check-equal? (smallest-divisior 199) 199)
(check-equal? (smallest-divisior 1999) 1999)
(check-equal? (smallest-divisior 19999) 7)
