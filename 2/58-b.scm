(load "58-a.scm")

(define (rest-of-calc s) 
	(if (null? (cdddr s))
		(caddr s)
		(cddr s)))

(define augend rest-of-calc)
(define multiplicand rest-of-calc)

(define (kind-of-calc? calc) 
	(lambda (x) (and (list? x) (eq? (cadr x) calc))))

(define (make-sum a1 a2) 
	(cond 
		((=number? a1 0) a2) 
		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list a1 '+ a2))))

(define (addend s) (car s))
(define (augend s) (rest-of-calc s))


(define (make-product m1 m2) 
	(cond 
		((=number? m1 0) 0)
		((=number? m2 0) 0)
		((=number? m1 1) m2)
		((=number? m2 1) m1)
		((and (number? m1) (number? m2)) (* m1 m2))
	  	(else (list m1 '* m2))))

(define (multiplier p) (car p))
(define (multiplicand p) (rest-of-calc p))

(define (main parameters)
	(print (make-sum 1 1))
	(print (make-product 2 2))
	(print (make-sum (make-product 2 'x) 4))
	(print (sum? (make-sum 2 'x)))
	(print (sum? 1))
	(print (product? (make-product 2 'x)))
	(print (product? (make-sum 2 'x)))
	(print (deriv '(x * y) 'x))
	(print (deriv '((x * y) * (x + 3)) 'x))
	(print (deriv '(2 * x + y + z + y * x * z) 'x))
	(print (deriv '(x + 3 * (x + y + 2)) 'x))
	)