(define (same-parity x . y)
	(define (iter remain in-l out-l)
		(if (null? in-l)
			out-l
			(iter 
				remain 
				(cdr in-l)
				(if (= (remainder (car in-l) 2) remain)
					(cons (car in-l) out-l)
					out-l))))
	(iter (remainder x 2) y '()))

(define (main argv)
	(print (same-parity 2 3 4 5 6 7 8 9)))