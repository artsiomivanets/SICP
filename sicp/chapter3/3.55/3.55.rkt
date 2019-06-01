#lang racket/base

(require racket/stream)

(define (streams-map op . streams)
  (if (null? streams)
      (empty-stream)
      (stream-cons
        (apply op (map stream-first streams))
        (apply streams-map (cons op (map stream-rest streams))))))

(define (add-streams s1 s2)
  (streams-map + s1 s2))

(define (partial-sums s)
  (define result
    (stream-cons (stream-first s) (add-streams result (stream-rest s))))
  result)



(provide partial-sums add-streams)


