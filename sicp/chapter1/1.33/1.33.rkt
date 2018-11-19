#lang racket/base

(define (filtered-accumulate predicate combiner null-value a term b next)
  (cond ((> a b) null-value)
        ((predicate a)
         (combiner (term a)
                   (filtered-accumulate predicate
                                        combiner
                                        null-value
                                        (next a)
                                        term
                                        b
                                        next)))
        (else (filtered-accumulate predicate
                                   combiner
                                   null-value
                                   (next a)
                                   term
                                   b
                                   next))))


(provide filtered-accumulate)

