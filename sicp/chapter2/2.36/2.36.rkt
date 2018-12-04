#lang racket/base

(define (accumulate-n proc init seq)
  (if (null? (car seq))
      (list)
      (cons (foldl proc init (map (lambda (elem) (car elem)) seq))
            (accumulate-n proc init (map (lambda (elem) (cdr elem)) seq)))))

(provide accumulate-n)


