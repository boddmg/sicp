(load "46.scm")
(load "47.scm")

(define (segments->painter segment-list) 
	(lambda (frame)
		(for-each
			(lambda (segment)
				(draw-line
					((frame-coord-map frame)
						(start-segment segment))
					((frame-coord-map frame)
						(end-segment segment))))
			segment-list)))

(define (main parameters)
	(segments->painter 
		(list 
			(make-segment (make-vect 1 2) (make-vect 4 4))
			(make-segment (make-vect 2 3) (make-vect 3 4)))) )
