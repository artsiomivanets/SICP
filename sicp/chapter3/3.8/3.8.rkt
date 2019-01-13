#lang racket/base

(define f
  (let ((state 1))
    (lambda (n)
      (set! state (* state n))
      state)))

(define x
  (let ((state 1))
    (lambda (n)
      (set! state (* state n))
      state)))

(provide f x)


