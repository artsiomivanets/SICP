#lang racket/base

(require math/number-theory)

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " *********** ")
  (display elapsed-time)
  (newline)
  #t)

(define (search-for-primes start end)
  (cond ((= end 0) (display "END"))
        ((timed-prime-test start)
         (search-for-primes (+ 1 start) (- end 1)))
        (else
          (search-for-primes (+ 1 start) end))))

(search-for-primes 10000000000000000000000000000000000000000000000000000000 3)

(provide search-for-primes)

