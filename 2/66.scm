(load "66-key-value-set.scm")
(load "utilities.scm")

(define (look-up given-key set-of-records)
	(cond
		((null? set-of-records) false))
		((= given-key (key (entry set-of-records))) 
			(value (entry set-of-records)))
		((< given-key (key (entry set-of-records)))
			(look-up given-key (left-branch set)))
		((> given-key (key (entry set-of-records)))
			(look-up given-key (right-branch set))))

(define (main parameters)
	(print "a"))
