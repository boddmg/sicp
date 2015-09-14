(define (=number? var num) 
	(and (number? var) (= var num)))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (kind-of-calc? calc) 
	(lambda (x) (and (list? x) (eq? (car x) calc))))

(define (make-sum a1 a2) 
	(cond 
		((=number? a1 0) a2) 
		((=number? a2 0) a1)
		((and (number? a1) (number? a2)) (+ a1 a2))
		(else (list '+ a1 a2))))

(define (sum? x) ((kind-of-calc? '+) x))

(define (addend s) (cadr s))
(define (augend s) (caddr s))


(define (make-product m1 m2) 
	(cond 
		((=number? m1 0) 0)
		((=number? m2 0) 0)
		((=number? m1 1) m2)
		((=number? m2 1) m1)
		((and (number? m1) (number? m2)) (* m1 m2))
	  	(else (list '* m1 m2))))

(define (product? x) ((kind-of-calc? '*) x))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))


(define (make-exponentiation base exponent)
	(cond 
		((=number? base 0) 0)
		((=number? exponent 0) 1)
		((=number? exponent 1) base)
		(else (list '** base exponent))))

(define exponentiation? (kind-of-calc? '**))

(define (base x) (cadr x))
(define (exponent x) (caddr x))


(define (deriv exp var) 
	(cond 
		((number? exp) 0)
		((variable? exp) 
			(if (same-variable? exp var) 1 0)) 
		((sum? exp) 
			(make-sum 	(deriv (addend exp) var)
                       	(deriv (augend exp) var)))
        ((product? exp)
         	(make-sum
           		(make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
           		(make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))

        ((exponentiation? exp)
        	(make-product 
        		(exponent exp)
        		(make-exponentiation (base exp) (- (exponent exp) 1))))

		(else
		(error "unknown expression type: DERIV" exp))))

(define (main parameters)
	(print (make-sum 1 1))
	(print (make-product 2 2))
	(print (make-sum (make-product 2 'x) 4))
	(print (sum? (make-sum 2 'x)))
	(print (sum? 1))
	(print (product? (make-product 2 'x)))
	(print (product? (make-sum 2 'x)))
	(print (deriv '(* (* x y) (+ x 3)) 'x))
	(print (make-exponentiation 'x 10))
	(print (deriv (make-exponentiation 'x 10) 'x))
	(print (deriv (make-exponentiation 'x 2) 'x))
	)
