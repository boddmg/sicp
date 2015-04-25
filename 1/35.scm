; golden ratio φ has the formula: φ^2 = φ + 1 => φ = 1 + 1/φ
(load "35-fixed-point.scm")
(define (f x)
	(+ 1 (/ 1 x)))

(define (main argv)
	(print (fixed-point f 1)))
