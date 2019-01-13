#lang racket/base

(require rackunit "3.7.rkt")

(define paul-pass 'paul)
(define peter-pass 'peter)

(define paul-acc (make-acc 100 paul-pass))
(define peter-acc (make-joint paul-acc paul-pass peter-pass))

(check-equal? ((paul-acc paul-pass 'deposit) 100) 200)
(check-equal? ((peter-acc peter-pass 'withdraw) 10) 190)
