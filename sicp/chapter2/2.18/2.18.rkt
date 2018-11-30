#lang racket/base

(define (my-reverse items)
  (if (null? items)
      '()
      (append (my-reverse (cdr items)) (list (car items)))))

(define (reverse-iter items)
  (define (iter result rest-items)
    (if (null? rest-items)
        result
        (iter (cons (car rest-items) result) (cdr rest-items))))
  (iter '() items))

(provide reverse-iter my-reverse)


