#lang racket/base

(define (make-point x y) (cons x y))
(define (point-x point) (car point))
(define (point-y point) (cdr point))

(define (make-rectangle left-top right-bottom)
  (cons left-top right-bottom))
(define (rectangle-top-left rectangle)
  (car rectangle))
(define (rectangle-bottom-right rectangle)
  (cdr rectangle))

(define (rectangle-width rectangle)
  (- (point-x (rectangle-bottom-right rectangle))
     (point-x (rectangle-top-left rectangle))))
(define (rectangle-height rectangle)
  (- (point-y (rectangle-top-left rectangle))
     (point-y (rectangle-bottom-right rectangle))))

(define (rectangle-per rectangle)
  (* 2 (+ (rectangle-width rectangle)
          (rectangle-height rectangle))))

(define (rectangle-area rectangle)
  (* (rectangle-width rectangle)
     (rectangle-height rectangle)))


(provide make-point make-rectangle rectangle-per rectangle-area)


