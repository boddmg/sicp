(load "29-sum.scm")
(define (Simpson-integration f a b n)
	(define h (/ (- b a) n))
	(set! times 2)
	(/ (* h
		(+ 
			(sum 
				(lambda (x) 
					(begin
						;(format #t "times~A\n" times)
						(set! times (* 2 (/ 4 times)))
						(* (f x) times)))
				(+ a h) 
				(- b h) 
				(lambda (x) (+ x h)))
			(f a)
			(f b))
		) 3)
	)

(define (main argv)
	(print (Simpson-integration square 1 2 1000))
	;(format #t "~A \n" 123)
	)