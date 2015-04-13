(load "29-sum.scm")

(define (sum term a b next) 
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (+ (term a) result))))
	(iter a 0))
