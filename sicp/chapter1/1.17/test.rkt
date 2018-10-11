#lang racket/base

(require rackunit "1.17.rkt")

(check-equal? (multiply 2 2) 4)
(check-equal? (multiply 2 3) 6)
(check-equal? (multiply 2 4) 8)
(check-equal? (multiply 3 5) 15)
(check-equal? (multiply 5 5) 25)
