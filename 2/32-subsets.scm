(use srfi-1)


(define (subsets s)
	(if (null? s)
		(list '())
		(let ((rest (subsets (cdr s))))
			(append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define (main parameters)
	(print (subsets (list 1 2 3)))
)
