(load "42-compose.scm")

(define (repeated f n)
	(define (iter last-f n)
		(if (= n 1)
			last-f
			(iter (compose f last-f) (- n 1))))
	(iter f n))

(define (main argv)
	(print ((repeated inc 10) 1)))