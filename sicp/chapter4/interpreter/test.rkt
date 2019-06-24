#lang racket/base

(require rackunit "interpreter.rkt")


(define expr '(+ 1 2))
(define simple-list '(list 1 2))
(define simple-cons '(cons 1 2))
(define list-as-cons '(cons 1 (cons 2 (list))))
(define simple-car '(car (list 1 2)))
(define simple-cdr '(cdr (list 1 2)))
(define bool-true '(if (> 2 1) 1 2))
(define bool-false '(if (> 1 2) 1 2))
(define definition '((define a 1) a))

(define lambda-call '(((lambda (a) (+ a 1)) 1)))


(define factorial-of-six
  '(
    (define (fac n)
      (if (= n 1)
          1
          (* n (fac (- n 1)))))
    (fac 6)
    ))

(define closure
  '(
    (define (clos-sum a)
      (lambda (b) (+ a b)))
    (define fn (clos-sum 1))
    (fn 1)
    ))

(define simple-let
  '(let ((a (+ 1 0))
         (b (+ 0 2)))
     (+ a b)))

(define complex-let
  '(let* ((a 1)
          (b (+ a 1)))
     (+ a b)))

(define complex-let-with-set
  '(let* ((a 1)
          (b (set! a 2)))
     a))

(check-equal? (interpreter expr) 3)
(check-equal? (interpreter simple-list) (list 1 2))
(check-equal? (interpreter simple-cons) (cons 1 2))
(check-equal? (interpreter list-as-cons) (cons 1 (cons 2 '())))
(check-equal? (interpreter simple-car) 1)
(check-equal? (interpreter simple-cdr) (list 2))
(check-equal? (interpreter bool-true) 1)
(check-equal? (interpreter bool-false) 2)
(check-equal? (interpreter definition) 1)
(check-equal? (interpreter lambda-call) 2)
(check-equal? (interpreter factorial-of-six) 720)
(check-equal? (interpreter closure) 2)
(check-equal? (interpreter simple-let) 3)
(check-equal? (interpreter complex-let) 3)
(check-equal? (interpreter complex-let-with-set) 2)
