#lang racket/base

(require rackunit "2.41.rkt")

(check-equal? (threes 2 4) (list (list 1 1 2) (list 1 2 1) (list 2 1 1)))
(check-equal? (unique-threes 2) (list (list 1 1 1) (list 1 1 2) (list 1 2 1) (list 1 2 2) (list 2 1 1) (list 2 1 2) (list 2 2 1) (list 2 2 2)))
