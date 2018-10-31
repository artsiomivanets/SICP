#lang racket/base

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder a b) 0))

(define (find-divisior n test-divisior)
  (cond ((> (square test-divisior) n) n)
        ((divides? n test-divisior) test-divisior)
        (else (find-divisior n (+ test-divisior 1)))))

(define (smallest-divisior n)
  (find-divisior n 2))

(provide smallest-divisior)

