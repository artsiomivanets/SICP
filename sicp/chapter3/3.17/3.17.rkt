#lang racket/base

(require rnrs/mutable-pairs-6)

(define (find-index index coll)
  (cond ((null? coll) #f)
        ((eq? (mcar coll) index) #t)
        (else (find-index index (mcdr coll)))))

(define (count-pairs x)
  (define (iter indexes rest)
    (cond ((not (mpair? rest)) 0)
          ((find-index rest indexes) 0)
          (else (+ 1
                   (iter (mcons rest indexes) (mcar rest))
                   (iter (mcons (mcar rest) (mcons rest indexes)) (mcdr rest))))))
  (iter '() x))

(provide count-pairs)


