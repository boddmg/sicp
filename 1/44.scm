(load "utility.scm")
(load "42-compose.scm")
(load "43-repeated.scm")
(load "40-deriv.scm")

(define (smooth f)
	(lambda (x) 
		(/
			(+
				(f (+ x dx))
				(f (- x dx))
				(f x))
			3)))

(define (n-smooth f n)
	((repeated smooth n) f))

(define (x2+2x+1 x)
	(+ (* x x) (* 2 x) 1))

(define (main argv)
	(print (map x2+2x+1 (range 0 10 0.1)))
	(print (map (n-smooth x2+2x+1 1) (range 0 10 0.1)))
	(print (map (n-smooth x2+2x+1 2) (range 0 10 0.1)))
	(print (map (n-smooth x2+2x+1 10) (range 0 10 0.1)))
)