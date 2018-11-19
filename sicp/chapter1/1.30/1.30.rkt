#lang racket/base

(define (sum term a next b)
  (define (iter result improved-a)
    (if (> improved-a b)
        result
        (iter (+ result
                 (term improved-a))
              (next improved-a))))
  (iter 0 a))

(provide sum)

