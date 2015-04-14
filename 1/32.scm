(define (accumulate combiner null-value term a b next)
	(if (> a b)
		null-value
		(combiner (term a) (accumulate combiner null-value term (next a) b next)))
	)

(define (product term a b next) 
	(accumulate * 1 term a b next))

(define (sum term a b next) 
	(accumulate + 0 term a b next))

(define (main argv)
	(print (* 4 (product 
		(lambda (x) 
			(* 	(/ (- x 1) x)
				(/ (+ x 1) x)))
		3 9000 (lambda (x) (+ x 2)))))
	(print 
		(sum (lambda (x) x) 
			1 
			100
			(lambda (x) (+ x 1)) )))

