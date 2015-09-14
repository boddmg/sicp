(define (equal? a b)
	(cond 
		((and (list? a) (list? b))
			(or 
				(and (null? a) (null? b))
				(and 
					(equal? (car a) (car b))
					(equal? (cdr a) (cdr b)))))
		((not (or (list? a) (list? b)))
			(eq? a b))
		(else #f)))

(define (main parameters)
	(print (equal? '(this is a list) '(this is a list)))
	(print (equal? '(this is a list) '(this (is a) list)))
	(print (equal? '(this (is an) list) '(this (is a) list)))
	(print (equal? '(this (is an) list) '(this (is an) list)))
	(print (equal? '(this (is (an)) list) '(this (is (an)) list)))
)