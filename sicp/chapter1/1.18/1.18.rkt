#lang racket/base

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (multiply a b)
  (define (multiply-iter product a b)
    (cond ((= b 0) product)
          ((even? b)
           (multiply-iter product (double a) (halve b)))
          (else (multiply-iter (+ a product) a (- b 1)))))
  (multiply-iter 0 a b))

(provide multiply)

