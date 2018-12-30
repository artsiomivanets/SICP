#lang racket/base

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((< x (car set)) #f)
        ((= x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) '(x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(provide element-of-set? adjoin-set)


