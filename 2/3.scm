(load "3-rectangle-calculate.scm")


(define (main argv)
	(print (circumference-rectangle 
		(make-rectangle 
			(make-point 0 0) 
			(make-point 3 0) 
			(make-point 0 3)
			(make-point 0 3))))
	(print (area-rectangle 
		(make-rectangle 
			(make-point 0 0) 
			(make-point 3 0) 
			(make-point 0 3)
			(make-point 3 3)))))
