#lang racket/base

(require rackunit "2.61.rkt")

(check-equal? (element-of-set? 2 '(1 5 8 9 10)) #f)
(check-equal? (element-of-set? 5 '(1 2 3 5 8 9 10)) #t)
(check-equal? (adjoin-set 7 '(1 5 6 8 9)) '(1 5 6 7 8 9))
(check-equal? (adjoin-set 7 '(1 5 6 7 8 9)) '(1 5 6 7 8 9))
(check-equal? (adjoin-set 2 '(1 5 6 8 9)) '(1 2 5 6 8 9))
; (check-equal? (union-set '(1 5 6 8 9) '(2 4 7 9)) '(1 2 4 5 6 7 8 9))
; (check-equal? (union-set '(1 2 3) '(20 30 40)) '(1 2 3 20 30 40))

