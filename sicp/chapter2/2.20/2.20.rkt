#lang racket/base

(define (same-parity first . rest)
  (cons first (filter (if (odd? first) odd? even?) rest)))

(define (filter predicate coll)
  (let ((next-iteration (lambda () (filter predicate (cdr coll)))))
   (cond ((null? coll) '())
         ((predicate (car coll))
          (cons (car coll) (next-iteration)))
         (else (next-iteration)))))

(provide same-parity)


