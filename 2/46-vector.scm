
(define (make-vect x y)
	(cons x y))

(define (xcor-vect vect)
	(car vect))

(define (ycor-vect vect)
	(cdr vect))

(define (first-order-proc-vect proc)
	(lambda (vect1 vect2) 
		(make-vect
			(proc (xcor-vect vect1) (xcor-vect vect2))
			(proc (ycor-vect vect1) (ycor-vect vect2)))))

(define add-vect (first-order-proc-vect +))

(define sub-vect (first-order-proc-vect -))

(define (scale-vect scale vect)
	(make-vect 
		(* scale (xcor-vect vect))
		(* scale (ycor-vect vect))))

