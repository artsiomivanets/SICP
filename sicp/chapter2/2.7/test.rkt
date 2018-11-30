#lang racket/base

(require rackunit "2.7.rkt")

(check-equal? (lower-bound (make-interval 3 6)) 3)
(check-equal? (upper-bound (make-interval 3 6)) 6)
