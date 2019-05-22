#lang racket/base

(require rnrs/mutable-pairs-6
         compatibility/mlist)

(define (make-table same-key?)
  (let ((local-table (list->mlist (list 'table))))
   (define (dispatch op)
     (cond ((eq? op 'lookup) lookup)
           ((eq? op 'insert!) insert!)
           ((eq? op 'show) show)
           (else "Error")))
   (define (show)
     (display local-table))

   (define (assoc table key)
     (let ((records (mcdr table)))
      (cond ((null? records) #f)
            ((same-key? (mcar (mcar records)) key)
             (mcar records))
            (else (assoc records key)))))

   (define (add-record key value table)
     (set-mcdr! table (mcons (mcons key value) (mcdr table))))

   (define (insert! keys value)
     (define (iter keys value table)
       (let ((rest-of-keys (cdr keys))
             (record (assoc table (car keys))))
         (if record
             (cond ((null? rest-of-keys)
                    (set-mcdr! record value))
                   ((mpair? (mcdr record))
                    (iter rest-of-keys value record))
                   (else
                     (set-mcdr! record (list->mlist (list)))
                     (iter rest-of-keys value record)))
             (let ((key (car keys)))
              (let ((next-table (list->mlist (list key (mcons key value)))))
               (cond ((null? rest-of-keys) (add-record key value table))
                     (else (set-mcdr! table
                                      (mcons next-table
                                             (mcdr table)))
                           (iter rest-of-keys value next-table))))))))
     (iter keys value local-table))

   (define (lookup keys)
     (define (iter keys table)
       (let ((rest-of-keys (cdr keys))
             (record (assoc table (car keys))))
         (cond ((and record (not (null? rest-of-keys)))
                (iter rest-of-keys record))
               (record (mcdr record))
               (else #f))))
     (iter keys local-table))

   dispatch))





(provide make-table)


