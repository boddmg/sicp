(load "1-print-rat.scm")
(load "../1/33-gcd.scm")

(define (numer x) 
	(car x)) 

(define (denom x) 
	(cdr x))

(define (make-rat n d)
	(let ((is- (if (< (* n d) 0)
		-1
		1)))
		(let ((g (gcd (abs n) (abs d) )))
			(cons (* is- (/ (abs n) g)) (/ (abs d) g)))))

(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
	(* (numer y) (denom x)))
	(* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
	(* (numer y) (denom x)))
	(* (denom x) (denom y))))

(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
	(* (denom x) (denom y)))) 

(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
	(* (denom x) (numer y))))
