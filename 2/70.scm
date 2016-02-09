(load "69.scm")

(define (main parameters)

	(let (
		(message '(
			get a job
		sha na na na na na na na na
		get a job
		sha na na na na na na na na
		Wah yip yip yip yip 
		yip yip yip yip yip
		sha boom))
		(tree (generate-huffmen-tree 
			'(  (a 2) (na 16) (boom 1)    
				(sha 3) (get 2) (yip  9)
				(job 2) (wah 1)))))
	;(print tree)
	;(print message)
	(print (length (encode message tree)))
	(print (* 3 (length message)))
	))