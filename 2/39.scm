(load "38-fold.scm")
(load "utilities.scm")
(define (reverse sequence)
	(fold-right (lambda (x y) 
		(print x)
		(print y)
		(cons y x)) nil sequence))

;(define (reverse sequence)
;(fold-left (lambda (x y) (cons x y)) nil sequence))

(define (main argv)
	(print (reverse (list 1 2 3)))
)