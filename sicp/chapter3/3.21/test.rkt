#lang racket/base

(require rackunit
         rnrs/mutable-pairs-6
         "3.21.rkt")


(define q1 (make-queue))

(check-equal? (empty-queue? q1) #t)

(insert-queue! q1 'a)
(insert-queue! q1 'b)

(check-equal? (empty-queue? q1) #f)
(check-equal? (front-queue q1) 'a)

(delete-queue! q1)

(check-equal? (front-queue q1) 'b)
