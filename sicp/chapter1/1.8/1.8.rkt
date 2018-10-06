#lang racket/base

(define (square x)
  (* x x))

(define (cube-average x y)
  (/ (+ x y) 3))

(define (improve guess x)
  (cube-average (/ x (square guess)) (* 2 guess)))

(define (good-enough? old-guess new-guess)
  (< (abs (- new-guess old-guess)) 0.001))

(define (cube x)
  (define (cube-iter old-guess new-guess)
    (if (good-enough? old-guess new-guess)
        new-guess
        (cube-iter new-guess (improve new-guess x))))
  (cube-iter 0 1.0))

(provide cube)

