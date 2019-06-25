#lang racket/base

(require "interpreter.rkt")

(define the-global-env (setup-env))

(define (driver-loop)
  (display "> ")
  (let ((input (read)))
   (displayln (eval* input the-global-env)))
  (driver-loop))

(driver-loop)
