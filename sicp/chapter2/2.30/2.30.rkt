#lang racket/base

(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) (list))
        ((pair? (car tree))
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))
        (else (cons (square (car tree))
                    (square-tree (cdr tree))))))

(define (map-square-tree tree)
  (map (lambda (elem)
         (if (pair? elem)
             (map-square-tree elem)
             (square elem)))
       tree))

(provide square-tree map-square-tree)


