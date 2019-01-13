#lang racket/base

(define (make-accumulator value)
  (lambda (amount)
    (begin (set! value (+ value amount))
           value)))

(provide make-accumulator)


