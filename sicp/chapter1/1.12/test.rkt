#lang racket/base

(require rackunit "1.12.rkt")

(check-equal? (pascal-triangle 5 3) 6)
(check-equal? (pascal-triangle 4 2) 3)
