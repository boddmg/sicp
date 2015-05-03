(load "2.scm")
(load "2-distance.scm")
(define (make-rectangle p1 p2 p3)
	(cons p1 (cons p2 (cons p3 '()))))

(define (length-rectangle rectangle)
	(cons 
		(distance-point 
			(point-rectangle rectangle 1) (point-rectangle rectangle 2))
		(distance-point
			(point-rectangle rectangle 1) (point-rectangle rectangle 3))))

(define (point-rectangle rectangle order)
	(cond 
		((= order 1) (car rectangle))
		((= order 2) (car (cdr rectangle)))
		((= order 3) (car (cddr rectangle)))
	))

(define (print-rectangle rectangle)
	(display "[")
	(print-point (car rectangle))
	(display ",")
	(print-point (car (cdr rectangle)))
	(display ",")
	(print-point (car (cddr rectangle)))
	(display "]"))

(define (main argv)
	(print (length-rectangle 
		(make-rectangle (make-point 0 0) (make-point 3 0) (make-point 0 3)))))