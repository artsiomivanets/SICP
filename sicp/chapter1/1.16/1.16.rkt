#lang racket/base

(define (square x) (* x x))

(define (fast-exp num n)
  (define (fast-exp-iter product num n)
    (display 1)
    (display newline)
    (cond ((= n 0) product)
          ((even? n)
           (fast-exp-iter product (square num) (/ n 2)))
          (else (fast-exp-iter (* product num) num (- n 1)))))
  (fast-exp-iter 1 num n))

(provide fast-exp)

