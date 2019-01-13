#lang racket/base

(require rackunit "3.4.rkt")

(define pass 'secret-password)
(define acc (make-acc 100 pass))

((acc 'some-other-pass 'withdraw) 10)
((acc 'some-other-pass 'withdraw) 10)
((acc 'some-other-pass 'withdraw) 10)
((acc 'some-other-pass 'withdraw) 10)
((acc 'some-other-pass 'withdraw) 10)
((acc 'some-other-pass 'withdraw) 10)
((acc 'some-other-pass 'withdraw) 10)

(check-equal? ((acc 'some-other-pass 'withdraw) 10) '(call police))
