(load "35-fixed-point.scm")
(load "40-deriv.scm")
(define (newtons-transform f)
	(lambda (x) 
		(- x (/ (f x) ((deriv f) x)))))

(define (newtons-method g first-guess)
	(fixed-point (newtons-transform g) first-guess))