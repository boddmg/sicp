(load "33-accumulate.scm")
(load "28-fringe.scm")
(define (count-leaves x) (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
	                 (count-leaves (cdr x))))))

(define (count-leaves t)
	(accumulate (lambda (x y) (+ x y)) 0 (map (lambda (x) 1) (fringe t))))

(define (main argv)
	(print (count-leaves (list (list 1 (list 2 3)) (list (list 4 5) (list 6 7))))))