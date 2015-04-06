(load "24.scm")

(define (fermat-test n)
	(define (try-it a last-result)
		;(format #t "~A ~A\n" a last-result)
		(if (= a 1)
			last-result
			(if (and last-result #t)
				(try-it (- a 1) (= (expmod a n n) a))
				#f)))
	(try-it (- n 1) #t))

(define (Miller-Rabin-test n)
	
	)

(define (main arg)
	(print (fermat-test 561))
	(print (fermat-test 1105))
	(print (fermat-test 1729))
	(print (fermat-test 2465))
	(print (fermat-test 2821))
	(print (fermat-test 6601))
	(print (fermat-test 1000))
	)