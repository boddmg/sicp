(define (for-each procedure l)
	(if (null? l)
		#t
		(begin 
			(procedure (car l))
			(for-each procedure (cdr l)))))

(define (main argv)
	(for-each (lambda (x) (newline)
            (display x))
          (list 57 321 88)))

