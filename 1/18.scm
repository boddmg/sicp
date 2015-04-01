(define (even? n)
	(= (remainder n 2) 0))

(define (double x)
	(+ x x))

(define (halve x)
	(/ x 2))

(define even-op double)
(define odd-op +)

(define (fast-mul b n)
	(define (fast-mul-iter a b n)
		(format #t "~A ~A ~A\n" a b n)
		(cond 
			((= n 0)
				a)
			((even? n)
				(fast-mul-iter a (even-op b) (halve n)))
			(else 	
				(fast-mul-iter (+ a b) b (- n 1)))))
	(fast-mul-iter 0 b n))

(define (main arg)
	(print (fast-mul 1000 1000))
	)
