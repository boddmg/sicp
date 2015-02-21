(define (+ a b) 
	(if (= a 0) 
		b 
		(inc (+ (dec a) b)))) 
; It's the recursive, it will expansion "a" inc.

(define (+ a b) 
	(if (= a 0) 
		b 
		(+ (dec a) (inc b))))
; It is the iterative.

