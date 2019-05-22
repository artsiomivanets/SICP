#lang racket/base

(require rnrs/mutable-pairs-6
         compatibility/mlist)

(define (make-table same-key?)
  (let ((local-table (list->mlist (list 'table))))
    (define (dispatch op)
      (cond ((eq? op 'lookup) lookup)
            ((eq? op 'insert!) insert!)
            (else "Error")))

    (define (assoc table key)
      (let ((records (mcdr table)))
       (cond ((null? records) #f)
             ((same-key? (mcar (mcar records))
                         key)
              (mcar records))
             (else (assoc records key)))))

    (define (insert! key value)
      (let ((record (assoc local-table key)))
       (if record
           (set-mcdr! record value)
           (set-mcdr! local-table
                      (mcons (mcons key value) (mcdr local-table))))))

    (define (lookup key)
      (let ((record (assoc local-table key)))
       (if record
           (mcdr record)
           #f)))

    dispatch))





(provide make-table)


