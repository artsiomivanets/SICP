#lang racket/base

(define (make-acc balance . passwords)
  (define (withdraw amount)
    (if (> balance amount)
        (begin (set! balance (- balance amount)) balance)
        '(not enough money)))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (add-account pass)
    (begin (set! passwords (cons pass passwords))
           dispatch))
  (define (dispatch entered-password proc)
    (cond ((not (memq entered-password passwords))
           (lambda (x) '(password wrong)))
          ((equal? proc 'add-account) add-account)
          ((equal? proc 'withdraw) withdraw)
          ((equal? proc 'deposit) deposit)))
  dispatch)

(define (make-joint acc acc-pass new-pass)
  ((acc acc-pass 'add-account) new-pass))

(provide make-acc make-joint)


