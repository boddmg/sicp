(define (square-list l)
	(map (lambda (x) (* x x)) l))

(define (square-list items) 
	(if (null? items)
		'()
		(cons (* (car items) (car items)) (square-list (cdr items)))))

(define (main argv)
	(print (square-list '(1 2 3 4)))
	(print (cons 1 (cons 2 (cons 3 '())))))