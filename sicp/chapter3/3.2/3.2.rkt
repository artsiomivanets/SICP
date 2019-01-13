#lang racket/base

(define (make-monitored f)
  (let ((calls-amount 0))
   (lambda (x)
     (cond ((equal? x 'how-many-calls?) calls-amount)
           ((equal? x 'reset-calls)
            (set! calls-amount 0))
           (else (begin (set! calls-amount (+ calls-amount 1))
                        (f x)))))))

(provide make-monitored)


