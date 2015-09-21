(load "61.scm")

(define (union-set set1 set2)
	(define (iter set subset1 subset2)
		(cond 
			((null? subset1)
				(append set subset2))
			((null? subset2)
				(append set subset1))
			((= (car subset1) (car subset2))
				(iter 	
					(append set (list (car subset1))) 
					(cdr subset1) 
					(cdr subset2)))
			((< (car subset1) (car subset2))
				(iter 
					(append set (list (car subset1)))
					(cdr subset1)
					subset2))
			(else 
				(iter 
					(append set (list (car subset2)))
					subset1
					(cdr subset2)))))
	(iter '() set1 set2))

(define (main parameters)
	(print (union-set '(1 2 3 4 5) '(3 4 5 6 7)))
	(print (union-set '(1 2 3 4.5 5) '(3 4 5 6 7)))
	(print (union-set '(1 2 3) '(4 5 6 7)))
)