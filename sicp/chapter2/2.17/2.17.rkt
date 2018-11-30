#lang racket/base

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(define (last-pair-iter items)
  (define (iter result rest-items)
    (if (null? rest-items)
        result
        (iter (car rest-items) (cdr rest-items))))
  (iter '() items))

(provide last-pair last-pair-iter)


