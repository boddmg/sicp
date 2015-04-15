(load "32-iter.scm")

(define (accumulate combiner null-value term a b next)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner (term a) result))))
	(iter a null-value))


(define (filtered-accumulate combiner null-value term a b next filter)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) 
				(if (filter a)
					(combiner (term a) result)
					(combiner null-value result)))))
	(iter a null-value))

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