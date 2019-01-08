#lang racket/base

(define (element-of-set x set)
  (cond ((null? set) #f)
        ((equal? (car set) x) #t)
        (else (element-of-set x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((not (element-of-set (car set1) set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        (else  (union-set (cdr set1) set2))))

(provide union-set)

