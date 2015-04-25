(load "37.scm")
(define (tan-cf x k)
	(con-frac-recursive
		(lambda (i) 
			(if (= i 1)
				x
				(- 0 (* x x))))
		(lambda (i)
			(- (* 2 i) 1))
		k))
(define (main argv)
	(print (tan-cf 1 7))
	(print (tan 1))
)
