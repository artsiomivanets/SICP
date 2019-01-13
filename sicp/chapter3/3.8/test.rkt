#lang racket/base

(require rackunit "3.8.rkt")

(check-equal? (+ (f 0) (f 1)) 0)
(check-equal? (+ (x 1) (x 0)) 1)
