#lang racket/base

(define (pascal-triangle row col)
  (cond ((= row 1) 1)
        ((or (= col row) (= col 1)) 1)
        (else (+ (pascal-triangle (- row 1) (- col 1))
                 (pascal-triangle (- row 1) col)))))

(provide pascal-triangle)

