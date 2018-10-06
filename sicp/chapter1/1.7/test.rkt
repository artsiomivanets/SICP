#lang racket/base

(require rackunit "1.7.rkt")

(check-equal? (round (sqrt 9)) 3.0)
(check-equal? (round (sqrt 16)) 4.0)
(check-equal? (round (sqrt 25)) 5.0)
