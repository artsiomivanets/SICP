#lang racket/base

(require rackunit
         racket/stream
         "3.54.rkt")

(define ones (stream-cons 1 ones))
(define integers (stream-cons 1 (add-streams ones integers)))
(define factorial (stream-cons 1 (mul-streams factorial integers)))

(check-equal? (stream-ref integers 2) 3)
(check-equal? (stream-ref factorial 5) 120)


