(define (compose f g)
	(lambda (x) (f (g x))))

(define (square x)
	(* x x))

(define (inc x)
	(+ x 1))

(define (main argv)
	(print ((compose square inc) 1)))