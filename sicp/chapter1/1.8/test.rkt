#lang racket/base

(require rackunit "1.8.rkt")

(check-equal? (round (cube 27)) 3.0)
(check-equal? (round (cube 64)) 4.0)
