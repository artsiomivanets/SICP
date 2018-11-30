#lang racket/base

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (sub-interval a b)
  (make-interval (- (lower-bound a)
                    (upper-bound b))
                 (- (upper-bound a)
                    (lower-bound b))))

(provide make-interval lower-bound upper-bound sub-interval)


