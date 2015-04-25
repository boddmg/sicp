(load "utility.scm")
(define (lg x)
	(/ (log x) (log 10)))

(define (main argv)
	(print (round (lg 1024) )))