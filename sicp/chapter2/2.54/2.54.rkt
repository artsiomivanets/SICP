#lang racket/base

(define (my-equal? a b)
  (cond ((and (not (pair? a))
              (not (pair? b)))
         (eq? a b))
        ((and (pair? a)
              (pair? b))
         (and (my-equal? (car a) (car b))
              (my-equal? (cdr a) (cdr b))))
        (else #f)))

(provide my-equal?)


