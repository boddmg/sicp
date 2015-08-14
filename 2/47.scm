(define (make-frame origin edge1 edge2) 
	(list origin edge1 edge2))

(define (origin-frame frame)
	(car frame))

(define (edge1-frame frame)
	(cadr frame))

(define (edge2-frame frame)
	(caddr frame))

(define (make-frame-1 origin edge1 edge2) 
	(cons origin (cons edge1 edge2)))

(define (edge2-frame frame)
	(cddr frame))

(define (frame-coord-map frame) 
	(lambda (v)
		(add-vect
			(origin-frame frame)
			(add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
			(scale-vect (ycor-vect v) (edge2-frame frame))))))


(define (main parameters)
	(print (edge2-frame (make-frame-1 1 2 3))))