(define (max-sum x1 x2 x3)
	(- (+ x1 x2 x3) (min x1 x2 x3))
	)
(display (max-sum 1 2 3))