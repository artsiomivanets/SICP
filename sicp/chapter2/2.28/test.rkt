#lang racket/base

(require rackunit "2.28.rkt")

(define x (list (list 1 (list 2) 3) (list (list (list 4)))))
(check-equal? (fringe x) (list 1 2 3 4))
(check-equal? (fringe-iter x) (list 1 2 3 4))
