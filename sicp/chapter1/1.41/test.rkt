#lang racket/base

(require rackunit "1.41.rkt")

(define (inc x) (+ 1 x))

(check-equal? (((double (double double)) inc) 5) 8)
