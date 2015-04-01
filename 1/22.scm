(import scheme)
(use srfi-19)
(require-extension srfi-19-core)
(load "21.scm")

(define (runtime)
	(time->nanoseconds (current-time)))

(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(begin 
			(report-prime (- (runtime) 
						start-time))
			#t)
	 	#f))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (prime? n)
	(= (smallest-divisor n) n))

(define (even? n)
	(= (remainder n 2) 0))

(define (search-for-primes start end)
	(if (even? start)
		(search-for-primes (+ start 1) end)
		(if (timed-prime-test start)
			#t
			(search-for-primes (+ start 2) end))))

(define (main parameters)
	(search-for-primes 1000000000 10000000)
	(search-for-primes 10000000000 10000000)
	(search-for-primes 100000000000 10000000)
	;The time is near the sqrt(3) times between the processes.
)