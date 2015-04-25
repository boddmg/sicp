(load "utility.scm")
(load "45-lg.scm")
(load "40-average-damp.scm")
(load "41-double.scm")
(load "43-repeated.scm")
(load "35-fixed-point.scm")

(define (n-root x n)
	(fixed-point ((repeated average-damp (lg n)) (lambda (y) (/ x (pow y (- n 1))))) x) )

(define (main argv)
	(define test-times 30)
	(print (n-root 10 test-times))
	)