(load "46-vector.scm")
(load "47-frame.scm")
(load "49-svg-draw-line.scm")

(define context (svg-create-context))

(define (svg-add-element element)
	(set! context (string-append context element)))

(define (draw-line start-point end-point)
	(svg-add-line (make-segment start-point end-point)))

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

(define (list-frame-coord-map frame segments-list)
	(map 
		(lambda (segment) 
			(make-segment 
				((frame-coord-map frame) (start-segment segment))
				((frame-coord-map frame) (end-segment segment))))
		segments-list))


