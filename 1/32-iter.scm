(load "32.scm")

(define (accumulate combiner null-value term a b next)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner (term a) result))))
	(iter a null-value))

