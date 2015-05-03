(load "32-iter.scm")
(load "27.scm")
(load "33-gcd.scm")

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

(define prime? fermat-test)

(define (prime-sum a b)
	(filtered-accumulate + 0 
		(lambda (x) x)
		a b
		(lambda (x) (+ x 1))
		prime?))

(define (relatively-prime-product n)
	(filtered-accumulate * 1
		(lambda (x) x)
		1 n
		(lambda (x) (+ x 1))
		(lambda (x) (= (gcd x n) 1))
	))

(define (main argv)
	(print (relatively-prime-product 8))
	)