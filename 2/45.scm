(load "44.scm")

(define (split first-proc second-proc) 
	(define (split-body painter n)
		(if (= n 0)
			painter
			(let ((smaller (split-body painter (- n 1))))
		        (first-proc painter (second-proc smaller smaller)))))
	split-body)

(define right-split (split beside below)) 

(define up-split (split below beside))