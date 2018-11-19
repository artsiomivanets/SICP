#lang racket/base

(require rackunit "1.32.rkt")

(define (add-one x) (+ x 1))
(define (identity x) x)
(define (square x) (* x x))
(define (special-sum x)
  (if (odd? x)
      (+ 2 x)
      (+ 1 x)))

(define (factorial x)
  (accumulate * 1 1 identity x add-one))

(define (sum-odd a b)
  (accumulate + 0 a identity b special-sum))

(define (factorial-iter x)
  (accumulate-iter * 1 1 identity x add-one))

(check-equal? (sum-odd 1 9) 25)
(check-equal? (factorial 6) 720)
(check-equal? (factorial-iter 5) 120)
