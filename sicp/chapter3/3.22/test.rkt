#lang racket/base

(require rackunit
         rnrs/mutable-pairs-6
         "3.22.rkt")


(define q1 (make-queue))

(check-equal? ((q1 "empty-queue?")) #t)

((q1 "insert-queue!") 'a)
((q1 "insert-queue!") 'b)

(check-equal? ((q1 "empty-queue?")) #f)
(check-equal? ((q1 "front-queue")) 'a)
(check-equal? ((q1 "rear-queue")) 'b)

((q1 "delete-queue!"))

(check-equal? ((q1 "front-queue")) 'b)
