(define (cube-iter last-guess guess x) 
	(if (good-enough? last-guess guess x) 
		guess (cube-iter guess (improve guess x) x)
		)
	)

(define (cube x) 
	(* x x x)
	)

(define (improve guess x)
	(/ (+ (/ x (* guess guess)) 
		(+ guess guess)) 3)
	)

(define (good-enough? last-guess guess x) 
	(< (/ (abs (- last-guess guess))
		x)
	 0.001))

(define (cube-root x) (cube-iter 0 1.0 x))
(display (cube-root 27))