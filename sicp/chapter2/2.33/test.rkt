#lang racket/base

(require rackunit "2.33.rkt")

(define (square x) (* x x))

(check-equal? (my-accumulate (lambda (acc item) (+ acc item)) 0 (list 2 3 4)) 9)
(check-equal? (my-accumulate (lambda (acc item) (append acc (list (square item)))) (list) (list 2 3 4)) (list 4 9 16))
(check-equal? (my-map square (list 2 3 4)) (list 4 9 16))
(check-equal? (my-append (list 1 2) (list 3 4)) (list 1 2 3 4))
(check-equal? (my-length (list 1 2 3)) 3)
