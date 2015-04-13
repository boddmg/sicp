(define (sum term start end next)
	(if (> start end)
		0
		(+ 	(term start)
			(sum term (next start) end next))))

(define (inc x)
	(+ x 1))

(define (integral f a b dx)
	(define (add-dx x)
		(+ x dx))
	(* (sum f (+ a (/ dx 2)) b add-dx) dx))

(define (square x)
	(* x x))

(define (main args)
	(print (integral square 1 2 0.001)))