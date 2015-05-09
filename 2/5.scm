(load "../1/utility.scm")


(define (cons x y)
	(* (pow 2 x) (pow 3 y)))

(define (c-iter sum counter base)
	(if (or (= (remainder sum base) 0) (= sum 0) )
		(c-iter (/ sum base) (+ counter 1) base)
		counter))

(define (car z)
	(c-iter z 0 2))

(define (cdr z)
	(c-iter z 0 3))


(define (main argv)
	(print (cdr (cons 3 10)))
	;(print (cons 3 0))
)