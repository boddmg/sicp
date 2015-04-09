(load "24.scm")

(define (nontrivial-square-root? a m)
	(and 
		(= (remainder (square a) m) 1)
		(not (= a 1))
		(not (= a (- m 1)))
		))

(define (expmod-for-Miller-Rabin base exp n)
	(cond 
		((= exp 0) 1)
		((nontrivial-square-root? base n) 0)
		((even? exp)
		 (remainder 
			 (square (expmod base (/ exp 2) n))
			 n))
		(else
			(remainder 
				(* base (expmod base (- exp 1) n))
				n))))

(define (non-zero-random n)
	(+	(random (- n 1)) 
		1))

(define (Miller-Rabin-test n)
	(define (try-it n times) 
		; (format #t "~A ~A\n" a last-result)
		(cond 
			((= times 0) 
				#t)
			((= (expmod-for-Miller-Rabin (non-zero-random n) (- n 1) n) 1)
				(try-it n (- times 1)))
			(else
				#f)))
	(try-it n (ceiling (/ n 2))))

(define (main arg)
	(print (Miller-Rabin-test 101))
	(print (Miller-Rabin-test 13))
	(print (Miller-Rabin-test 561))
	(print (Miller-Rabin-test 1105))
	(print (Miller-Rabin-test 1729))
	(print (Miller-Rabin-test 2465))
	)
