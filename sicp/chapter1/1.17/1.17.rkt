#lang racket/base

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (multiply a b)
  (cond ((= b 1) 0)
        ((even? b)
         (+ (double a) (multiply a (halve b))))
        (else (+ a (multiply a (- b 1))))))

(provide multiply)

