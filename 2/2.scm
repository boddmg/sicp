(load "2-point-base.scm")
(load "2-midpoint-segment.scm")


(define (main argv)
	(print-point (midpoint-segment (make-point 1 2) (make-point 3 6))))
