(define (make-point x y)
	(cons x y))

(define (x-point p)
	(car p))

(define (y-point p)
	(cdr p))

(define (print-point p) 
	(display "(") 
	(display (x-point p)) 
	(display ",")
	(display (y-point p))
	(display ")"))