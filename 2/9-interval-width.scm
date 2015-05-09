(load "8-sub-interval.scm")

(define (width-interval x)
	(/ (- (upper-bound x) (lower-bound x)) 2))

(define (main parameters)

	(print 
		(width-interval 
				(make-interval 4 10)))

	(print 
		(width-interval 
				(make-interval 1 2)))
	
	(print 
		(width-interval 
			(sub-interval
				(make-interval 1 2)
				(make-interval 4 10))))

	(print 
		(width-interval 
			(add-interval
				(make-interval 4 10)
				(make-interval 1 2))))

	(print 
		(width-interval 
			(div-interval
				(make-interval 4 10)
				(make-interval 1 2))))

	(print 
		(width-interval 
			(mul-interval
				(make-interval 4 10)
				(make-interval 1 2))))

	(print-interval 
			(div-interval
				(make-interval -4 1)
				(make-interval 1 2)))

) 
