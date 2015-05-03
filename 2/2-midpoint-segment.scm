(load "2-point-base.scm")
(define (midpoint-segment p1 p2)
	(make-point 
		(/ (+ (x-point p1) (x-point p2)) 2)
		(/ (+ (y-point p1) (y-point p2)) 2)))