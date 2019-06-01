#lang racket/base

(require rackunit
         racket/stream
         "3.55.rkt")

(define ones (stream-cons 1 ones))
(define integers (stream-cons 1 (add-streams ones integers)))

(define s (partial-sums integers))
(define new-integers (partial-sums ones))

(check-equal? (stream-ref s 3) 10)
(check-equal? (stream-ref s 4) 15)
(check-equal? (stream-ref s 5) 21)

(check-equal? (stream-ref new-integers 0) 1)
(check-equal? (stream-ref new-integers 1) 2)
(check-equal? (stream-ref new-integers 2) 3)

