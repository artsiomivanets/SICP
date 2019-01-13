#lang racket/base

(require rackunit "3.2.rkt")

(define (square x) (* x x))
(define monitored-square (make-monitored square))

(monitored-square 10)
(monitored-square 15)

(check-equal? (monitored-square 'how-many-calls?) 2)
(monitored-square 'reset-calls)
(check-equal? (monitored-square 'how-many-calls?) 0)
