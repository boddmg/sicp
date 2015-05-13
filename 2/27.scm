(define x (list (list 1 2) (list 3 4)))
(reverse x)

(define (deep-reverse l)
	(reverse (map 
		(lambda (sub-l) 
			(if (list? sub-l)
				(deep-reverse sub-l)
				sub-l))
		l)))

(define (main parameters)
	(print x)
	(print (deep-reverse x)))