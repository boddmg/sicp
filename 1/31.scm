
(define (product term a b next)
	(if (> a b)
		1
		(* (term a) (product term (next a) b next)))
	)

(define (main argv)
	(print (* 4 (product 
		(lambda (x) 
			(* 	(/ (- x 1) x)
				(/ (+ x 1) x)))
		3 9000000 (lambda (x) (+ x 2))))))
