#lang racket/base

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))

(define (map-square-list items)
  (map square items))

(provide square-list map-square-list)


