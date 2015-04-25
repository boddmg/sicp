(load "40-newtons.scm")
(define (cubic a b c)
	(lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(define (cubic-zero a b c)
	(newtons-method (cubic a b c) 1))

(define (main argv)
	(print (cubic-zero 1 2 3)))