(load "49.scm")

(define (transform-painter painter origin corner1 corner2) 
	(lambda (frame)
		(let ((m (frame-coord-map frame)))
			(let ((new-origin (m origin)))
		        (painter (make-frame
	                new-origin
	                (sub-vect (m corner1) new-origin)
	                (sub-vect (m corner2) new-origin)))))))

(define (transform-painter painter origin corner1 corner2) 
	(lambda (frame)
		(let ((m (frame-coord-map frame)))
			(let ((new-origin (m origin)))
		        (painter (make-frame
	                new-origin
	                (sub-vect (m corner1) new-origin)
	                (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter) 
	(transform-painter painter
		(make-vect 0.0 1.0) ; new origin
		(make-vect 1.0 1.0) ; new end of edge1 
		(make-vect 0.0 0.0))) ; new end of edge2


(define (shrink-to-upper-right painter) 
	(transform-painter	
		painter 
		(make-vect 0.5 0.5)
		(make-vect 1.0 0.5) 
		(make-vect 0.5 1.0)))

(define (rotate90 painter) 
	(transform-painter painter
		(make-vect 1.0 0.0)
		(make-vect 1.0 1.0)
		(make-vect 0.0 0.0)))

(define (squash-inwards painter) (transform-painter painter
                     (make-vect 0.0 0.0)
                     (make-vect 0.65 0.35)
                     (make-vect 0.35 0.65)))

(define (beside painter1 painter2)
	(let ((split-point (make-vect 0.5 0.0)))
		(let (
				(paint-left (transform-painter
		            painter1
		            (make-vect 0.0 0.0)
		            split-point
		            (make-vect 0.0 1.0)))
		        (paint-right
		           (transform-painter
		            painter2
		            split-point
		            (make-vect 1.0 0.0)
		            (make-vect 0.5 1.0))))
			(lambda (frame) (paint-left frame) (paint-right frame)))))

(define (flip-horiz painter) 
	(transform-painter painter
		(make-vect 1.0 0.0) ; new origin
		(make-vect 0.0 0.0) ; new end of edge1 
		(make-vect 1.0 1.0))) ; new end of edge2

(define wave
	(segments->painter
		(append
			outline-segment
			wave-segment)))

(define (main parameters)
	(svg-add-header)
	( (flip-horiz wave)
		(make-frame 
			(make-vect 500 500) 
			(make-vect 100 0) 
			(make-vect 0 100)))
	
	(svg-add-end)
	(write-string 
		context
		(open-output-file "image.svg"))

)