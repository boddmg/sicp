(load "35-fixed-point.scm")

(define (fixed-point f first-guess)
	(define (try guess)
		(print guess)
		(let ((next (f guess)))
		(if (close-enough? guess next)
		next
      (try next))))
	  (try first-guess))

(define (f x)
	(/ (log 1000) (log x)))

(define (main argv)
	(print (fixed-point f 4)))
