#lang racket/base

(require rackunit "2.68.rkt")

(define tree (make-code-tree (make-leaf 'A 4)
                                    (make-code-tree
                                      (make-leaf 'B 2)
                                      (make-code-tree (make-leaf 'D 1)
                                                      (make-leaf 'C 1)))))
(define bits '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(define message '(A D A B B C A))

(check-equal? (encode message tree) bits)

