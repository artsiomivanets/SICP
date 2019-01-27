#lang racket/base

(require rackunit
         rnrs/mutable-pairs-6
         "3.18.rkt")

(define last (mcons 'c 'c))
(define cycled (mcons 'a (mcons 'b last)))
(set-mcdr! last cycled)

(check-equal? (cycle? cycled) #t)
