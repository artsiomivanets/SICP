#lang racket/base

(require rnrs/mutable-pairs-6)

(define (find-index index coll)
  (cond ((null? coll) #f)
        ((eq? (mcar coll) index) #t)
        (else (find-index index (mcdr coll)))))

(define (cycle? x)
  (let ((seen '()))
   (define (iter seq)
     (cond ((not (mpair? x)) #f)
           ((null? seq) #f)
           ((find-index (mcdr seq) seen) #t)
           (else
             (set! seen (mcons seq seen))
             (iter (mcdr seq)))))
   (iter x)))

(provide cycle?)


