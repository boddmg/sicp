;(define (square x)
	;(* x x))

(define (f g) (g 2))

(define (main parameters)
	(print (f f)))

; (f f) -> (f (f 2)) -> (f (2 2))
; So, it throw out a unexception error that the "2" is not a callable procedure.
