#lang racket/base
(define (driver-loop)
  (display "> ")
  (let ((input (read)))
   (displayln (car input)))
  (driver-loop))

(driver-loop)
