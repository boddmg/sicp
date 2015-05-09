(define (last-pair l)
	(if (null? (cdr l))
		(car l)
		(last-pair (cdr l))))

(define (main parameters)
	(print (last-pair (list 23 72 149 34))))