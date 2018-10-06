#lang racket/base

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average (/ x guess) guess))

(define (good-enough? old-guess new-guess)
  (< (abs (- new-guess old-guess)) 0.001))

(define (sqrt x)
  (define (sqrt-iter old-guess new-guess)
    (if (good-enough? old-guess new-guess)
        new-guess
        (sqrt-iter new-guess (improve new-guess x))))
  (sqrt-iter 0 1.0))

(provide sqrt)

