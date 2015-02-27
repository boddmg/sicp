(load "shared.scm")
(use srfi-1)
(define (print-number-list number-list)
		(map 
			(lambda (x)
				(display 
					(if (= 0 x) " " (number->string x))))
			number-list)
		(display "\n"))
(print-number-list '(0 1 0 2 0 3))
(print (map + '(0 1 2 3 1) '(1 2 3 4 5)))
(print (drop '(1 2 3) 1))