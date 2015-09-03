(load "50.scm")

(define (below painter1 painter2)
	(let ((split-point (make-vect 0.0 0.5)))
	(let ((paint-upper (transform-painter
	            painter1
	            (make-vect 0.0 0.0)
	            (make-vect 1.0 0.0)
	        	split-point))
	          (paint-bottom
	           (transform-painter
	            painter2
	            split-point
	            (make-vect 1.0 0.5)
	            (make-vect 0 1.0))))
		(lambda (frame) 
			(paint-upper frame) 
			(paint-bottom frame)))))

(define (rotate270 painter)
	(rotate90 (rotate90 (rotate90 painter))))

(define (below1 painter1 painter2)
	(rotate90 (beside (rotate270 painter1) (rotate270 painter2))))


(load "44.scm")
(define (main parameters)
	(svg-add-header)
	((corner-split wave 3)
		(make-frame 
			(make-vect 0 0) 
			(make-vect 500 0) 
			(make-vect 0 500)))
	
	(svg-add-end)
	(write-string 
		context
		(open-output-file "image.svg"))

)