(define (reduce f first-result src-list)
	(define (iter f last-result new-list)
		(if (null? new-list)
			last-result
			(iter f (f last-result (car new-list)) (cdr new-list))))
	(iter f first-result src-list))

(define (upside-down src-list)
	(reduce (lambda (x y) (cons y x)) '() src-list))

(define (range start end step)
	(define (iter start end step last-list)
		(if (< start end)
			(iter (+ start step) end step (cons start last-list))
			last-list))
	(upside-down (iter start end step '())))

(define (main parameters)
	(print (range 0 10 1)))
