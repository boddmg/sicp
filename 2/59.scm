(load "utilities.scm")

(define (element-of-set? x set) 
	(cond 
		((null? set) false)
		((equal? x (car set)) true)
		(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) 
	(if (element-of-set? x set)
		set
		(cons x set)))

(define (intersection-set set1 set2)
	(cond 
		((or (null? set1) (null? set2)) '())
		((element-of-set? (car set1) set2)
	    	(cons (car set1) (intersection-set (cdr set1) set2)))
		(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
	(cond
		((null? set1) set2)
		((null? set2) set1)
	    ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
	    (else (cons (car set1) (union-set (cdr set1) set2)))
	))

(define (main parameters)
	(define set1 '(1 2 3 4 5))
	(print (element-of-set? 8 (adjoin-set 0 set1)))
	(print (intersection-set '(1 5) (adjoin-set 0 set1)))
	(print (union-set set1 '(4 5 6 7 8)))
)