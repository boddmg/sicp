(load "../1/6.scm")
(define (square x)
	(* x x))
(define (distance-point p1 p2)
	(sqrt (+ 
		(square (- (x-point p1) (x-point p2)))
		(square (- (y-point p1) (y-point p2))))))