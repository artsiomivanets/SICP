#lang racket/base

(define (make-center-percent average percent)
  (cons (- average (/ percent 100)) (+ average (/ percent 100))))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
(define (percent interval)
  (round (* 100
            (/ (- (upper-bound interval)
                  (lower-bound interval))
               2))))
(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))


(provide make-center-percent
         lower-bound
         upper-bound
         percent
         center)


