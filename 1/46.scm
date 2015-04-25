(load "utility.scm")

(define (iterative-improve good-enough? improve)
	(lambda (first-guess) 
		(define (iter guess)
			(if (good-enough? last-result)
				last-result
				(improve last-result)))
	(iter first-guess)))

(define tolerance 0.00001)
(define (close-enough? v1 v2) 
	(< (abs (- v1 v2)) tolerance)) 

(define (iterative-improve good-enough? improve)
	(define (try guess)
		(let ((next (improve guess)))
			(if (good-enough? guess next)
				next
				(try next))))
	try)

(define (fixed-point f first-guess) ((iterative-improve
	close-enough?
	f
	) first-guess))

(define (sqrt x)
	((iterative-improve close-enough? (lambda (guess) 
		(average guess (/ x guess))))
	x))

(define (f x)
	(+ 1 (/ 1 x)))

(define (main argv)
	(print (/ 1 (fixed-point f 1)))
	(print (sqrt 2))
)