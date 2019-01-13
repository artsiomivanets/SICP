#lang racket/base

(require rackunit "3.3.rkt")

(define pass 'secret-password)
(define acc (make-acc 100 pass))

(check-equal? ((acc pass 'deposit) 100) 200)
(check-equal? ((acc pass 'withdraw) 10) 190)
(check-equal? ((acc 'some-other-pass 'withdraw) 10) '(password wrong))
