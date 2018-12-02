#lang racket/base

(define (deep-reverse items)
  (define (iter result rest)
    (cond ((null? rest) result)
          ((pair? (car rest))
           (iter (cons (deep-reverse (car rest))
                       result)
                 (cdr rest)))
          (else (iter (cons (car rest)
                            result)
                      (cdr rest)))))
  (iter '() items))

(provide deep-reverse)


