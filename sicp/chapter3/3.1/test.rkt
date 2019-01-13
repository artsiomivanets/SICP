#lang racket/base

(require rackunit "3.1.rkt")


(define A1 (make-accumulator 10))
(define A2 (make-accumulator 10))

(A1 10)
(A1 15)

(A2 10)
(A2 5)

(check-equal? (A1 15) 50)
(check-equal? (A2 15) 40)
