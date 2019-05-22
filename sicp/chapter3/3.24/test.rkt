#lang racket/base

(require rackunit
         rnrs/mutable-pairs-6
         "3.24.rkt")


(define table (make-table eq?))

(check-equal? ((table 'lookup) 2) #f)
((table 'insert!) 1 1)
(check-equal? ((table 'lookup) 1) 1)
((table 'insert!) 2 1)
(check-equal? ((table 'lookup) 1) 1)

