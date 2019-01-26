#lang racket/base

(require rackunit
         rnrs/mutable-pairs-6
         "3.17.rkt")

(define x (mcons 'a '()))
(define y (mcons x x))
(define z (mcons y y))

(define b (mcons 'b 'b))
(define a (mcons 'a b))
(set-mcdr! b a)

(check-equal? (count-pairs z) 3)
(check-equal? (count-pairs b) 2)
