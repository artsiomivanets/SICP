#lang racket/base

(define (>= a b)
  (or (> a b) (= a b)))

(define (f n)
  (cond ((< n 3) n)
        ((>= n 3)
         (+ (f (- n 1))
            (f (- n 2))
            (f (- n 3))))))

(provide f)

