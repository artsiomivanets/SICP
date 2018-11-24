#lang racket/base

(require rackunit "2.1.rkt")

(define two-six (make-rat -2 -6))
(define one-half (make-rat 1 2))

(define result (mul-rat two-six one-half))
(define expected-result (make-rat -1 6))

(check-equal? result expected-result)
