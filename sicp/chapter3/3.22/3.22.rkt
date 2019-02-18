#lang racket/base

(require rnrs/mutable-pairs-6
         compatibility/mlist)

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (dispatch op)
      (cond ((eq? op "empty-queue?") empty-queue?)
            ((eq? op "front-queue") front-queue)
            ((eq? op "rear-queue") rear-queue)
            ((eq? op "delete-queue!") delete-queue!)
            ((eq? op "insert-queue!") insert-queue!)
            ((eq? op "set-front-pointer!") set-front-pointer!)
            ((eq? op "set-rear-pointer!") set-rear-pointer!)
            (else "Error")))

    (define (empty-queue?)
      (if (null? front-ptr)
          #t
          #f))

    (define (front-queue) (mcar front-ptr))

    (define (rear-queue) (mcar rear-ptr))

    (define (set-front-pointer! item) (set! front-ptr item))

    (define (set-rear-pointer! item) (set! rear-ptr item))

    (define (delete-queue!)
      (if (empty-queue?)
          (display "error")
          (set-front-pointer! (mcdr front-ptr))))

    (define (insert-queue! item)
      (let ((new-item (mcons item '())))
       (cond ((empty-queue?)
              (set-front-pointer! new-item)
              (set-rear-pointer! new-item))
             (else
               (set-mcdr! rear-ptr new-item)
               (set-rear-pointer! new-item)))))
    dispatch))





(provide make-queue)


