#lang racket/base

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter result improved-a)
    (if (> improved-a b)
        result
        (iter (* result (term improved-a)) (next improved-a))))
  (iter 1 a))

(provide product product-iter)

