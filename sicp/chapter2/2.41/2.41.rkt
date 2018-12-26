#lang racket/base

(require math/number-theory)

(define (enumerate-interval low high)
  (if (> low high)
      (list)
      (cons low (enumerate-interval (+ 1 low) high))))

(define (flatmap proc seq)
  (foldr append (list) (map proc seq)))


(define (unique-threes n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 n)))
                      (enumerate-interval 1 n)))
           (enumerate-interval 1 n)))

(define (sum seq)
  (foldr + 0 seq))

(define (threes n s)
  (filter (lambda (threes)
            (= (sum threes) s))
          (unique-threes n)))

(provide threes unique-threes)


