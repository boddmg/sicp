(load "37.scm")
(define (// x y)
	(/ (- x (modulo x y)) y))

(define (d4e i)
	(cond 
		((= (modulo i 3) 2) (* 2 (+ 1 (// i 3))))
		(else 1)))

(define (main argv)
	(print (+ 2 (con-frac-recursive 
		; n(i)
		(lambda (i) 
			1)
		; d(i)
		d4e
		10))))