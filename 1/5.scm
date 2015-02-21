(define (p) (p))
(define (test x y)
	(if (= x 0)
		0
		y))
(display (test 0 (p)))
;applicative-order evaluation:
;The result of it would be 0 because the (p) doesn't be evaled.
;normal-order evaluation
;It would be a infinity loop.
