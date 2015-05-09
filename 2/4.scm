(define (cons x y) (lambda (m) (m x y)))
(define (car z)
	(z (lambda (p q) p)))
(define (cdr z)
	(z (lambda (p q) q)))

(define (main argv)
	(print (cdr (cons 1 2))))
; (car (cons x y))  =>
; ((lambda (m) (m x y)) (lambda (q p) p)))  =>
; ((lambda (q p) p) x y))  =>
; x

