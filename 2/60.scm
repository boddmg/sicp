(load "59.scm")


(define (adjoin-set x set) 
	(cons x set))

(define (intersection-set set1 set2)
	(define (iter set1 set2 result)
		(cond 
			((or (null? set1) (null? set2)) result)
			((and (not (element-of-set? (car set1) result)) (element-of-set? (car set1) set2))
				(iter (cdr set1) set2 (cons (car set1) result)))
			(else (iter (cdr set1) set2 result))))
	(iter set1 set2 '()))

(define (main parameters)
	(define set1 '(1 2 3 4 5))
	(print (adjoin-set 2.5 set1))
	(print (element-of-set? 8 (adjoin-set 2.5 set1)))
	(print (intersection-set '(1 5 5) (adjoin-set 0 set1)))
	(print (union-set set1 '(4 5 6 6 7 8)))
)