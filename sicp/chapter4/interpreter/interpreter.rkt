#lang racket/base

;========================================================
;                   PRIMITIVES
;========================================================

(define primitives
  (list
    (list '+ +)
    (list '- -)
    (list '* *)
    (list '/ /)
    (list '> >)
    (list '< <)
    (list '= =)
    (list 'cons cons)
    (list 'car car)
    (list 'cdr cdr)
    (list 'list list)
    (list 'null? null?)))
(define primitive-names (map car primitives))
(define primitive-values (map cadr primitives))

;========================================================
;                   ENV PROCEDURES
;========================================================

(define the-empty-env '())

(define (make-env frame parent)
  (cons frame parent))

(define (empty-env? env) (null? env))

(define (parent-env env) (cdr env))

(define (first-frame env) (car env))

(define (setup-env)
  (let ((frame (make-frame primitive-names primitive-values)))
   (let ((env (make-env frame the-empty-env)))
    env)))

(define (extend-env params args env)
  (let ((frame (make-frame params args)))
   (let ((new-env (make-env frame env)))
    new-env)))

(define (find-variable var env callback)
  (cond ((empty-env? env)
         (error "Variable is unbound"))
        (else
          (let ((frame (first-frame env)))
           (cond ((frame-has-var? frame var)
                  (callback frame var))
                 (else
                   (find-variable var (parent-env env) callback)))))))

(define (lookup-variable-value var env)
  (find-variable var env get-frame-var))

(define (set-variable-value! var val env)
  (find-variable var
                 env
                 (lambda (frame var)
                   (set-frame-var! frame var val))))

;========================================================
;                   DEF PROCEDURES
;========================================================
(define (def-variable! var val env)
  (set-frame-var! (first-frame env) var val))

;========================================================
;                   FRAME PROCEDURES
;========================================================
(define (make-frame keys vals)
  (if (= (length keys) (length vals))
      (let ((table (make-hash)))
       (define (insert-loop keys vals)
         (cond  ((not (null? keys))
                 (hash-set! table (car keys) (car vals))
                 (insert-loop (cdr keys) (cdr vals)))
                (else table)))
       (insert-loop keys vals))
      (error "Wrong number of keys and values")))

(define (frame-has-var? frame var)
  (hash-has-key? frame var))

(define (get-frame-var frame var)
  (hash-ref frame var))

(define (set-frame-var! frame var val)
  (hash-set! frame var val))



;========================================================
;                   eval
;========================================================
(define (eval* expr env)
  (cond ((self-evaluating? expr) (eval-self expr env))
        ((variable? expr) (eval-var expr env))
        ((definition? expr) (eval-definition expr env))
        ((assignment? expr) (eval-assignment expr env))
        ((let*? expr) (eval-let* expr env))
        ((let? expr) (eval-let expr env))
        ((lambda? expr) (eval-lambda expr env))
        ((if? expr) (eval-if expr env))
        ((seq? expr) (eval-seq expr env))
        ((application? expr)
         (eval-application (eval* (operator expr) env)
                           (map (lambda (operand) (eval* operand env))
                                (operands expr))))
        (else (error "undefined type of expression"))))

(define (eval-self expr env) expr)

(define (eval-var expr env)
  (lookup-variable-value expr env))

(define (eval-application proc args)
  (cond ((primitive-procedure? proc)
         (apply proc args))
        (else
          (let ((expr (procedure-body proc))
                (env (extend-env (procedure-params proc)
                                 args
                                 (procedure-env proc))))
            (eval* expr env)))))

(define (eval-definition expr env)
  (let ((var (definition-var expr))
        (val (eval* (definition-val expr) env)))
    (def-variable! var val env)
    'ok))

(define (eval-assignment expr env)
  (let ((var (assignment-var expr))
        (val (eval* (assignment-val expr) env)))
    (set-variable-value! var val env)
    'ok))

(define (eval-lambda expr env)
  (let ((args (lambda-args expr))
        (body (lambda-body expr)))
    (make-procedure args body env)))

(define (eval-let expr env)
  (let ((args (let-args expr))
        (body (let-body expr))
        (vals (let-values expr)))
    (eval* (cons (make-lambda args body)
                 vals) env)))

(define (eval-let* expr env)
  (let ((args (let-args expr))
        (body (let-body expr))
        (vals (let-values expr)))
    (define (iter args vals)
      (if (null? args)
          body
          (cons (make-lambda (list (car args))
                             (iter (cdr args) (cdr vals)))
                (list (car vals)))))
    (eval* (iter args vals) env)))

(define (eval-if expr env)
  (let ((predicate (eval* (if-predicate expr) env)))
   (if (true? predicate)
       (eval* (if-consequence expr) env)
       (eval* (if-alternative expr) env))))

(define (eval-seq expr env)
  (cond ((null? (cdr expr))
         (eval* (car expr) env))
        (else
          (eval* (car expr) env)
          (eval-seq (cdr expr) env))))

(define (true? expr)
  (not (eq? expr #f)))

(define (false? expr)
  (eq? expr #f))

(define (self-evaluating? expr)
  (cond ((number? expr) #t)
        ((string? expr) #t)
        (else #f)))

(define (variable? expr)
  (symbol? expr))

(define (seq? expr)
  (and (pair? expr)
       (pair? (car expr))
       (not (lambda? (car expr)))))

(define (if? expr)
  (tagged-list? expr 'if))
(define (if-predicate expr) (cadr expr))
(define (if-consequence expr) (caddr expr))
(define (if-alternative expr) (cadddr expr))

(define (assignment? expr)
  (tagged-list? expr 'set!))
(define (assignment-var expr) (cadr expr))
(define (assignment-val expr) (caddr expr))

(define (definition? expr)
  (tagged-list? expr 'define))
(define (definition-var expr)
  (if (pair? (cadr expr))
      (caadr expr)
      (cadr expr)))
(define (definition-val expr)
  (if (pair? (cadr expr))
      (make-lambda (cdadr expr)
                   (caddr expr))
      (caddr expr)))

(define (let*? expr)
  (tagged-list? expr 'let*))

(define (let? expr)
  (tagged-list? expr 'let))
(define (let-args expr)
  (map car (cadr expr)))
(define (let-values expr)
  (map cadr (cadr expr)))
(define (let-body expr)
  (caddr expr))

(define (lambda? expr)
  (tagged-list? expr 'lambda))
(define (make-lambda args body)
  (list 'lambda args body))
(define (lambda-args expr) (cadr expr))
(define (lambda-body expr) (caddr expr))

(define (make-procedure args body env)
  (list 'procedure args body env))
(define (procedure-params p) (cadr p))
(define (procedure-body p) (caddr p))
(define (procedure-env p) (cadddr p))

(define (tagged-list? expr tag)
  (if (pair? expr)
      (eq? (car expr) tag)
      #f))

(define (compound-procedure? p)
  (tagged-list? p 'procedure))
(define (primitive-procedure? p)
  (not (compound-procedure? p)))

(define (application? expr)
  (pair? expr))
(define (operator expr) (car expr))
(define (operands expr) (cdr expr))

(define (interpreter expr)
  (eval* expr (setup-env)))

(provide interpreter eval* setup-env)

