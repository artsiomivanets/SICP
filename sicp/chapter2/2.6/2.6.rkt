#lang racket/base

(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add-one n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(provide add-one zero one two)


