#lang racket/base

(require rackunit "1.42.rkt")

(check-equal? ((compose square inc) 2) 9)
