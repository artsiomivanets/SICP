#lang racket/base

(require rackunit
         rnrs/mutable-pairs-6
         "3.25.rkt")


(define table (make-table equal?))
(define get (table 'lookup))
(define put (table 'insert!))
(define show (table 'show))

(check-equal? (get '(a b c)) #f)
(check-equal? (get '(a)) #f)
(check-equal? (get '(b)) #f)

(put '(a) 12)
(put '(b) 13)
(put '(c a) 14)

(check-equal? (get '(a)) 12)
(check-equal? (get '(b)) 13)
(check-equal? (get '(c a)) 14)
(put '(c b) 15)
(check-equal? (get '(c b)) 15)
(put '(c b d) 16)
(check-equal? (get '(c b d)) 16)
(put '(c) 5)
(check-equal? (get '(c)) 5)
