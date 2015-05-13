(define nil '())

(define (square x)
	(* x x))

(define (square-list items) 
	(define (iter things answer)
		(if (null? things) 
			(cons (cdr answer) nil)
			(iter (cdr things)
				;(cons (square (car things)) answer)))) ; Here is the reason.
				(cons answer (square (car things)))))) 
	(iter items nil))

(define (main argv)
	(print (square-list '(1 2 3 4))))