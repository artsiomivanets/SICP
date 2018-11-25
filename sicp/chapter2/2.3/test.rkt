#lang racket/base

(require rackunit "2.3.rkt")

(define rectangle (make-rectangle (make-point 0 2)
                                  (make-point 4 0)))

(check-equal? (rectangle-per rectangle) 12)
(check-equal? (rectangle-area rectangle) 8)
