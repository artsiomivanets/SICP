#lang racket/base

(require racket/stream)

(define (streams-map op . streams)
  (if (null? streams)
      (empty-stream)
      (stream-cons
        (apply op (map stream-first streams))
        (apply streams-map (cons op (map stream-rest streams))))))

(define (mul-streams s1 s2)
  (streams-map * s1 s2))

(define (add-streams s1 s2)
  (streams-map + s1 s2))

(provide mul-streams add-streams)


