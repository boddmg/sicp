(define (even? n)
	(= (remainder n 2) 0))

(define (double x)
	(+ x x))

(define (halve x)
	(/ x 2))

(define even-op double)
(define odd-op +)

(define (fast-mul b n)
	(format #t "~A ~A\n" b n)
	(cond 
		((= n 0)
			0)
		((even? n)
			(fast-expt (even-op b) (halve n))
			)
		(else 	
			(odd-op b (fast-expt b (- n 1))))))

(define (main arg)
	(print (fast-mul 3 5))
)
