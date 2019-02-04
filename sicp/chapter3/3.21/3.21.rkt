#lang racket/base

(require rnrs/mutable-pairs-6)

(define (display-queue queue) (display (front-pointer queue)))

(define (make-queue) (mcons '() '()))

(define (empty-queue? queue)
  (if (null? (front-pointer queue))
      #t
      #f))
(define (front-pointer queue) (mcar queue))

(define (rear-pointer queue) (mcdr queue))

(define (front-queue queue) (mcar (front-pointer queue)))

(define (rear-queue queue) (mcar (rear-pointer queue)))

(define (set-front-pointer! queue item) (set-mcar! queue item))

(define (set-rear-pointer! queue item) (set-mcdr! queue item))

(define (insert-queue! queue item)
  (let ((new-item (mcons item '())))
   (cond ((empty-queue? queue)
          (set-front-pointer! queue new-item)
          (set-rear-pointer! queue new-item))
         (else
           (set-mcdr! (rear-pointer queue) new-item)
           (set-rear-pointer! queue new-item)))))

(define (delete-queue! queue)
  (if (empty-queue? queue)
      (display "error")
      (set-front-pointer! queue (mcdr (front-pointer queue)))))


(provide make-queue
         front-queue
         insert-queue!
         delete-queue!
         empty-queue?)


