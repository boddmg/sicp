(load "46-vector.scm")
(define (make-segment start end)
	(cons start end))

(define (start-segment segment)
	(car segment))

(define (end-segment segment)
	(cdr segment))