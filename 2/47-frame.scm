(load "46-vector.scm")

(define (make-frame origin edge1 edge2) 
	(cons origin (cons edge1 edge2)))

(define (origin-frame frame)
	(car frame))

(define (edge1-frame frame)
	(cadr frame))

(define (edge2-frame frame)
	(caddr frame))

(define (make-frame-1 origin edge1 edge2) 
	(list origin edge1 edge2))

(define (edge2-frame frame)
	(cddr frame))

(define (frame-coord-map frame) 
	(lambda (v)
		(add-vect
			(origin-frame frame)
			(add-vect 
				(scale-vect 
					(xcor-vect v) 
					(edge1-frame frame))
				(scale-vect 
					(ycor-vect v) 
					(edge2-frame frame))))))

(define (main parameters)
	(define test-frame 
		(make-frame
			(make-vect 0 1)
			(make-vect 2 3)
			(make-vect 4 5)))
	(print (origin-frame test-frame))
	(print (edge1-frame test-frame))
	(print (edge2-frame test-frame))
)