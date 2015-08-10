(load "38-fold.scm")
(load "utilities.scm")

;(define (reverse sequence)
;	(accumulate + 0 sequence))

;(define (reverse sequence)
;(fold-left (lambda (x y) (cons x y)) nil sequence))

(define (reverse sequence) 
	(fold-right (lambda (x y) 
		(append y (list x))) nil sequence))

(define (reverse1 sequence) 
	(fold-left (lambda (x y) 
		(append (list y) x)) nil sequence))

(define (main argv)
	(print (reverse (list 1 2 3)))
	(print (reverse1 (list 1 2 3)))
	)