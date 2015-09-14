(load "56.scm")

(define (rest-of-calc s) 
	(if (null? (cdddr s))
		(caddr s)
		(cons (car s) (cddr s))))

(define augend rest-of-calc)
(define multiplicand rest-of-calc)

(define (main parameters)
	(print (deriv '(* x y (+ x 3)) 'x))
	)