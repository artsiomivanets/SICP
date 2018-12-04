#lang racket/base

(define (my-accumulate proc initial seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (proc result (car rest)) (cdr rest))))
  (iter initial seq))

(define (my-map proc seq)
  (my-accumulate (lambda (acc item) (append acc (list (proc item))))
                 (list)
                 seq))

(define (my-append seq1 seq2)
  (my-accumulate (lambda (acc item) (append acc (list item)))
                 seq1
                 seq2))

(define (my-length seq)
  (my-accumulate (lambda (acc item) (+ acc 1)) 0 seq))

(provide my-accumulate my-map my-length my-append)


