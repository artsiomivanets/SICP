#lang racket/base

(require rackunit
         rnrs/mutable-pairs-6
         "3.50.rkt")

(define a (str-enumerate 1 100000000000000000000000000000000000000000000000000000000000))
(check-equal? (str-car a) 1)
(check-equal? (str-car (str-cdr a)) 2)


