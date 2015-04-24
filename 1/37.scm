(define (con-frac-recursive n d k)
	(define (iter n d k i)
		(if (< i k)
			(/ (n i) (+ (d i) (iter n d k (+ i 1))))
			(/ (n k) (d k))))
	(iter n d k 1))

(define (con-frac-iterative n d k)
	(define (iter n d i last-value)
		(if (= i 0)
			last-value
			(if (= i k)
				(iter n d (- i 1) (/ (n k) (d k)))
				(iter n d (- i 1) (/ (n i) (+ last-value (d i)))))
			))
	(iter n d k 1))

(define (main argv)
	(print (con-frac-recursive 
		(lambda (x) 1)
		(lambda (x) 1)
		10))
	(print (con-frac-iterative
		(lambda (x) 1)
		(lambda (x) 1)
		10))
)