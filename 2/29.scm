(define (make-mobile left right) (list left right))

(define (make-branch length structure) (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))
(define mobile? list?)

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

(define (left-structure mobile) (branch-structure (left-branch mobile)))
(define (right-structure mobile) (branch-structure (right-branch mobile)))

(define (left-length mobile) (branch-length (left-branch mobile)))
(define (right-length mobile) (branch-length (right-branch mobile)))

(define (total-weight mobile)
	(if (mobile? mobile)
		(+ 	(total-weight (left-structure mobile)) 
			(total-weight (right-structure mobile)))
		mobile))

(define (balanced? structure)
	(if (not (mobile? structure))
		#t
		(and 
			(balanced? left-structure)
			(balanced? right-structure)
			(= 	(* (left-length structure) (total-weight (left-structure structure)))
				(* (right-length structure) (total-weight (right-structure structure)))))))

(define (main parameters)
	(define x (make-mobile 
		(make-branch 2 (make-mobile (make-branch 2 1) (make-branch 1 2)))
		(make-branch 3 2)))
	
	(define y (make-mobile 
		(make-branch 2 (make-mobile (make-branch 2 1) (make-branch 1 2)))
		(make-branch 3 3)))
	(print (total-weight x))
	(print (balanced? x))
	(print (balanced? y))
	)
