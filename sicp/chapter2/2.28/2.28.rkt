#lang racket/base

(define (fringe items)
  (cond ((null? items) (list))
        ((pair? (car items))
         (append (fringe (car items)) (fringe (cdr items))))
        (else (cons (car items) (fringe (cdr items))))))

(define (fringe-iter items)
  (define (iter result rest)
    (cond ((null? rest) result)
          ((pair? (car rest))
           (iter (append result
                         (fringe-iter (car rest)))
                 (cdr rest)))
          (else (iter (append result
                              (list (car rest)))
                      (cdr rest)))))
  (iter (list) items))

(provide fringe fringe-iter)


