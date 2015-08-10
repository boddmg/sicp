(load "40.scm")
(define (generate-triples n)
	(if (= n 1)
		nil
		(append 
			(generate-triples (- n 1))
			(flatmap (lambda (x) (list (append x (list n)))) (generate-pairs (- n 1)))
		)

	)
)

(define (generate-pairs n)
	(if (= n 0)
		nil
		(append
			(generate-pairs (- n 1))
			(flatmap (lambda (x) (list (list x n))) (enumerate-interval 1 (- n 1)))
		)
	)
)

(define (main parameters)
	(print (generate-triples 5))
)
