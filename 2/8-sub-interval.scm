(load "7.scm")

(define (sub-interval x y)
	(make-interval
		(- (lower-bound x) (upper-bound y))
		(- (upper-bound x) (lower-bound y))))

(define (main parameters)
	(print-interval 
		(sub-interval 
			(make-interval 3 4)
			(make-interval 1 2))))