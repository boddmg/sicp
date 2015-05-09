(define (reduce f first-result src-list)
	(define (iter f last-result new-list)
		(if (null? new-list)
			last-result
			(iter f (f last-result (car new-list)) (cdr new-list))))
	(iter f first-result src-list))

(define (reverse l)
	(reduce (lambda (x y) (cons y x)) '() l))

(define (main parameters)
	(print (reverse '(1 2 3 4))))