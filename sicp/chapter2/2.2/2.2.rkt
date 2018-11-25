#lang racket/base

(define (make-point x y) (cons x y))
(define (point-x point) (car point))
(define (point-y point) (cdr point))

(define (make-segment point1 point2) (cons point1 point2))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (average-point x y)
  (/ (+ x y) 2))

(define (midpoint-segment segment)
  (let ((midpoint-x (average-point (point-x (start-segment segment))
                                   (point-x (end-segment segment))))
        (midpoint-y (average-point (point-y (start-segment segment))
                                   (point-y (end-segment segment)))))
    (make-point midpoint-x midpoint-y)))

(provide make-point make-segment midpoint-segment)


