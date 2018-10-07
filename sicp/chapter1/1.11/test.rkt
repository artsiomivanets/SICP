#lang racket/base

(require rackunit "1.11.rkt")

(check-equal? (f 3) 3)
(check-equal? (f 4) 6)
(check-equal? (f 5) 11)
