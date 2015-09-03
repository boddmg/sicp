(load "51.scm")

(define wave-segment
	(list-frame-coord-map (make-frame 
		(make-vect 0 1) 
		(make-vect 1 0) 
		(make-vect 0 -1))
		(list 
			(make-segment (make-vect 0.45 0.7)      
                          (make-vect 0.5 0.65))
			(make-segment (make-vect 0.5 0.65)      
                          (make-vect 0.55 0.7 ))

			(make-segment (make-vect 0.4 1.0)      
                          (make-vect 0.35 0.85))
            (make-segment (make-vect 0.35 0.85)    
                          (make-vect 0.4 0.64))
            (make-segment (make-vect 0.4 0.65)     
                          (make-vect 0.25 0.65))
            (make-segment (make-vect 0.25 0.65)    
                          (make-vect 0.15 0.6))
            (make-segment (make-vect 0.15 0.6)     
                          (make-vect 0.0 0.85))
            (make-segment (make-vect 0.0 0.65)     
                          (make-vect 0.15 0.5))
            (make-segment (make-vect 0.15 0.5)    
                          (make-vect 0.25 0.55))
            (make-segment (make-vect 0.25 0.55)     
                          (make-vect 0.35 0.5))
            (make-segment (make-vect 0.35 0.5)     
                          (make-vect 0.25 0.0))
            (make-segment (make-vect 0.6 1.0)      
                          (make-vect 0.65 0.85))
            (make-segment (make-vect 0.65 0.85)    
                          (make-vect 0.6 0.65))
            (make-segment (make-vect 0.6 0.65)     
                          (make-vect 0.75 0.65))
            (make-segment (make-vect 0.75 0.65)    
                          (make-vect 1.0 0.3))
            (make-segment (make-vect 1.0 0.15)     
                          (make-vect 0.6 0.5))
            (make-segment (make-vect 0.6 0.5)      
                          (make-vect 0.75 0.0))
            (make-segment (make-vect 0.4 0.0)      
                          (make-vect 0.5 0.3))
            (make-segment (make-vect 0.6 0.0)      
                          (make-vect 0.5 0.3)))))

(define wave
	(segments->painter
		(append
			outline-segment
			wave-segment)))

(define (corner-split painter n) 
	(if (= n 0)
		painter
		(let ((up (up-split painter (- n 1)))
			(right (right-split painter (- n 1))))
			(let (
				(top-left (beside up up))
				(bottom-right (below right right)) 
				(corner (corner-split painter (- n 1))))

		        (beside (below top-left painter)
	                (below corner bottom-right))))))

(define (rotate180 painter)
	(rotate90 (rotate90 painter)))


(define (square-of-four tl tr bl br) 
	(lambda (painter)
		(let (
			(top (beside (tl painter) (tr painter))) 
			(bottom (beside (bl painter) (br painter))))
			(below top bottom))))

(define (square-limit painter n)
	(let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

(define (main parameters)
	(svg-add-header)
	((square-limit wave 3)
		(make-frame 
			(make-vect 0 0) 
			(make-vect 500 0) 
			(make-vect 0 500)))
	
	(svg-add-end)
	(write-string 
		context
		(open-output-file "image.svg"))

)