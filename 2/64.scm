(load "63.scm")

(define (list->tree elements)
	(car (partial-tree elements (length elements))))

(define (partial-tree elts n)
	(if (= n 0)
		(begin 
			(cons '() elts))
		(let ((left-size (quotient (- n 1) 2)))
			(let ((left-result
				(partial-tree elts left-size)))
				(let ((left-tree (car left-result)) 
					(non-left-elts (cdr left-result)) 
					(right-size (- n (+ left-size 1))))
					(let ((this-entry (car non-left-elts)) 
						(right-result
                   			(partial-tree
                    			(cdr non-left-elts)
                    			right-size)))
						(let ((right-tree (car right-result)) 
							(remaining-elts
                           		(cdr right-result)))
                      		(cons 
                      			(make-tree this-entry
                      				left-tree
                               		right-tree)
                            	remaining-elts))))))))

;The function partial-tree split the list into two equal part every time, and than
;combine them together.

(define (main parameters)
	(print (list->tree '(1 3 5 7 9 11)))
	(print (quotient 10 6))
)