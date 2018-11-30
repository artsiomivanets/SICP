#lang racket/base

(require rackunit "2.12.rkt")

(check-equal? (percent (make-center-percent 3.50 15.0)) 15.0)
(check-equal? (center (make-center-percent 3.50 15)) 3.50)
(check-equal? (lower-bound (make-center-percent 3.50 15)) 3.35)
(check-equal? (upper-bound (make-center-percent 3.50 15)) 3.65)
