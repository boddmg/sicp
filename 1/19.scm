(define (fib n)
	(fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
	(cond ((= count 0) 
		b)
		((even? count)
		(fib-iter a
					b
					(+ (* p p) (* q q))  ;compute p' = p^2 + q^2
					(+ (* q q) (* 2 p q))  ;compute q' = q^2 + 2pq
					(/ count 2)))
		(else 
		(fib-iter (+ (* b q) 
					(* a q) 
					(* a p))
					(+ (* b p) 
					(* a q))
					p
					q
					(- count 1)))))

(define (main arg)
	(print (fib 10))
  )