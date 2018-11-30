#lang racket/base

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(provide make-interval lower-bound upper-bound)


