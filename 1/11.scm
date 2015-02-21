(load "shared.scm")
(define (recusive-f n)
	(if (< n 3)
		n
		(+ 	(recusive-f (- n 1)) 
			(* (recusive-f (- n 2)) 2)
			(* (recusive-f (- n 3)) 3))
		)
	)

(define (iterative-f n)
	(define (iter-f n i f-i-1 f-i-2 f-i-3)
		(if (= i n)
			(+ f-i-1 (* 2 f-i-2) (* 3 f-i-3))
			(iter-f n 
					(+ i 1) 
					(iter-f i i f-i-1 f-i-2 f-i-3)
					f-i-1
					f-i-2
					)
			)
		)
	(if (< n 3)
		n
		(iter-f n 4 4 2 1)
		)
	)

(printl (recusive-f 10))
(printl (iterative-f 10))
