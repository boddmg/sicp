(define i1 (list 1 3 (list 5 7) 9))
(define i2 (list (list 7)))
(define i3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

	
(define (main parameters)
	(print i1)
	(print (car (cdaddr i1)))
	(print i2)
	(print (caar i2))
	(print i3)
	(print (cadadr (cadadr (cadadr i3))))
	)