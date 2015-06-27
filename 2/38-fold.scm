(load "33-accumulate.scm")
(load "utilities.scm")

(define fold-right accumulate)
(define fold fold-right)

(define (fold-left op initial sequence) (define (iter result rest)
	(if (null? rest) result
	        (iter (op result (car rest))
	              (cdr rest))))
	(iter initial sequence))

(define (main parameters)
	(print (fold-left / 1 (list 1 2 3)))
	(print (fold-right / 1 (list 1 2 3)))
	(print (fold-right list nil (list 1 2 3)))
	(print (fold-left list nil (list 1 2 3)))
	)