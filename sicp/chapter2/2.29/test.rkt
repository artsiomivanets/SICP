#lang racket/base

(require rackunit "2.29.rkt")

(define branch (make-branch 2 1))
(define balanced-mobile (make-mobile branch branch))

(define mobile (make-mobile branch
                            (make-branch 2 (make-mobile (make-branch 2 balanced-mobile)
                                                        (make-branch 2 balanced-mobile)))))

(check-equal? (total-weight mobile) 5)
(check-equal? (balanced? mobile) #f)
