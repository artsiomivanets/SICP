#lang racket/base

(require rackunit "2.2.rkt")

(define start-point (make-point 2 2))
(define end-point (make-point 6 6))
(define segment (make-segment start-point end-point))

(define result (midpoint-segment segment))
(define expected-result (make-point 4 4))

(check-equal? result expected-result)
