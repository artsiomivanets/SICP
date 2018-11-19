#lang racket/base

(require rackunit "1.33.rkt"
         math/number-theory)

(define (add-one x) (+ x 1))
(define (identity x) x)


(define (sum-odd a b)
  (filtered-accumulate prime? + 0 a identity b add-one))


(check-equal? (sum-odd 1 10) 17)
