(load "1-rat-base.scm")
(define (main argv)
	(print-rat (add-rat (make-rat -10 45) (make-rat 20 120) ) ))