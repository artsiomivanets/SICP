#lang racket/base

(define (delay delayed-object)
  (lambda () delayed-object))

(define (force force-object)
  ((force-object)))

(define (str-cons a b)
  (cons a (delay b)))

(define (str-car p)
  (car p))

(define (str-cdr p)
  (force (cdr p)))

(define (str-empty)
  '())

(define (str-null? str-object)
  (eq? str-object '()))

(define (str-enumerate low high)
  (if (> low high)
      str-empty
      (str-cons low (lambda () (str-enumerate (+ low 1) high)))))

(provide str-cons
         str-car
         str-cdr
         str-empty
         str-null?
         str-enumerate)


