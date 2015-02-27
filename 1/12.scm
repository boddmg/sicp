(load "shared.scm")
(use srfi-1)
(define (pasca-triangle layer)
	(define (print-number-list number-list)
		(map 
			(lambda (x)
				(display 
					(if (= 0 x) " " (number->string x))))
			number-list)
		(display "\n"))
	(define (pasca-triangle-iter layer block-width)
		(if (= layer 1)
			(begin
				(define this-layer (append 
					(make-list block-width 0)
					'(1)
					(make-list block-width 0)))
				(print-number-list this-layer)
				this-layer)
			(begin
				(define this-layer 
					(begin 
						(define last-layer 
							(pasca-triangle-iter 
								(- layer 1) 
								(+ block-width 1)))
						(map + 
							(append '(0) last-layer)
							(append (drop last-layer 1) '(0 0)))))
				(print-number-list this-layer)
				this-layer)))
	(pasca-triangle-iter layer 1))
(pasca-triangle 9)