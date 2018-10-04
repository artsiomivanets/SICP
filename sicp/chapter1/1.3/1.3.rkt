#lang racket/base

(define (square x)
  (* x x))


(define (two-max-squares a b c)
  (cond ((and (< a b) (< a c))
         (+ (square b) (square c)))
        ((and (< b a) (< b c))
         (+ (square a) (square c)))
        ((and (< c b) (< c a))
         (+ (square b) (square a)))))

(provide two-max-squares)

