#lang racket/base

(define (accumulate combiner null-value a term b next)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            (next a)
                            term
                            b
                            next))))

(define (accumulate-iter combiner null-value a term b next)
  (define (iter improved-a result)
   (if (> improved-a b)
       result
       (iter (next improved-a)
             (combiner (term improved-a) result))))
  (iter a null-value))

(provide accumulate accumulate-iter)

