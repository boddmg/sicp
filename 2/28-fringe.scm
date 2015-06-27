(use srfi-1)

(define x (list (list 1 2) (list 3 4))) 

(define (fringe l)
	(reduce-right
		(lambda (l1 l2) 
			(append 
				(if (and (list? l1) (not (null? l1)))
					(fringe l1)
					(list l1))
				(if (list? l2)
					(fringe l2)
					(list l2) ))) (list) l))

;(fringe x)
;(fringe (list x x))

(define (main parameters)
	(print (fringe x))
	(print (fringe (list x x)))
	)
