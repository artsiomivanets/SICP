#lang racket/base

(define (make-acc balance password)
  (define (withdraw amount)
    (if (> balance amount)
        (begin (set! balance (- balance amount)) balance)
        '(not enough money)))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch entered-password proc)
    (cond ((not (equal? entered-password password))
           (lambda (x) '(password wrong)))
          ((equal? proc 'withdraw) withdraw)
          ((equal? proc 'deposit) deposit)))
  dispatch)

(provide make-acc)


