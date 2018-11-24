#lang racket/base

(define (make-rat n d)
  (let ((g (gcd n d)))
   (cons (/ n g) (/ (abs d) g))))
(define (numer r) (car r))
(define (denom r) (cdr r))

(define (mul-rat r1 r2)
  (make-rat (* (numer r1) (numer r2))
            (* (denom r1) (denom r2))))

(provide mul-rat make-rat)


