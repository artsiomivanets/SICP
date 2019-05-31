#lang racket/base

(require racket/stream
         racket/trace)

(define (integers-starting-from n)
  (let ((stream (stream-cons n (integers-starting-from (+ 1 n)))))
   (fprintf (current-output-port) "take integers NEXT-INTEGER: ~s~n" n)
   stream))
(trace integers-starting-from)

(define integers
  (integers-starting-from 2))

(define (divisible? x y) (= (remainder x y) 0))

(define (sieve stream n)
  (stream-cons
    (stream-first stream)
    (sieve (stream-filter
             (lambda (x)
               (begin
                 (fprintf (current-output-port)
                          "start filter STACK: ~s STREAM-HEAD-IN-LAMBDA: ~s X: ~s ~n"
                          n
                          (stream-first stream)
                          x)
                 (not (divisible? x (stream-first stream)))))
             (and (fprintf (current-output-port) "~ntake rest of stream STREAM-HEAD: ~s STACK: ~s~n~n"
                           (stream-first stream)
                           n)
                  (stream-rest stream)))
           (+ 1 n))))
(trace sieve)

(define primes (sieve integers 1))

(stream-ref primes 2)
