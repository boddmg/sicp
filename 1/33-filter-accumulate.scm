(load "32-iter.scm")

(define (filtered-accumulate combiner null-value term a b next filter)
	(if (> a b)
		null-value
		(combiner 
			(if (filter a)
				(term a)
				null-value)
			(filtered-accumulate combiner null-value term (next a) b next filter)))
	)

(define (even? x)
	(= (remainder x 2) 0))

(define (main argv)
	(print (filtered-accumulate + 0 
		(lambda (x) x)
		1
		100
		(lambda (x) (+ x 1))
		even?))
	)