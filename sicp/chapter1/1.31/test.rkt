#lang racket/base

(require rackunit "1.31.rkt")

(define (add-one x) (+ x 1))
(define (identity x) x)

(define (factorial x)
  (product identity 1 add-one x))

(define (factorial-iter x)
  (product-iter identity 1 add-one x))

(check-equal? (product identity 1 add-one 4) 24)
(check-equal? (factorial 5) 120)
(check-equal? (factorial-iter 6) 720)
