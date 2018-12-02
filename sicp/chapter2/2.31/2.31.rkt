#lang racket/base

(define (square x) (* x x))

(define (tree-map proc tree)
  (map (lambda (elem)
         (if (pair? elem)
             (tree-map proc elem)
             (proc elem)))
       tree))

(define (square-tree tree) (tree-map square tree))

(provide square-tree)


