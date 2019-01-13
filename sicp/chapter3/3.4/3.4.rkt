#lang racket/base

(define (make-acc balance password)
  (let ((attempts 0))
   (define (withdraw amount)
     (if (> balance amount)
         (begin (set! balance (- balance amount)) balance)
         '(not enough money)))
   (define (deposit amount)
     (begin (set! balance (+ balance amount))
            balance))
   (define (dispatch entered-password proc)
     (cond ((= attempts 7)
            (lambda (x) '(call police)))
           ((equal? password entered-password)
            (set! attempts 0)
            (cond ((equal? proc 'withdraw) withdraw)
                  ((equal? proc 'deposit) deposit)))
           (else
             (set! attempts (+ 1 attempts))
             (lambda (x) '(password wrong)))))
   dispatch))

(provide make-acc)


