#lang racket/base

(require rackunit "1.43.rkt")

(check-equal? ((repeated inc 3) 5) 8)
