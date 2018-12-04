#lang racket/base

(define (count-leaves tree)
  (foldl (lambda (elem acc) (+ elem acc))
         0
         (map (lambda (sub-tree)
                (if (pair? sub-tree)
                    (count-leaves sub-tree)
                    1
                    ))
              tree)))

(provide count-leaves)


