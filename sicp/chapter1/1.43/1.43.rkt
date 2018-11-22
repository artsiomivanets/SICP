#lang racket/base

(define (square x) (* x x))

(define (inc x) (+ 1 x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f amount)
  (if (= 1 amount)
      (lambda (x) (f x))
      (compose f
               (repeated f (- amount 1)))))

(provide square repeated inc)

