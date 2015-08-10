(load "33-accumulate.scm")
(load "utilities.scm")
(load "../1/22.scm")

(define (enumerate-interval start end)
	(define (iter l start end)
		(if (> start end)
			l
			(iter (append l (list start)) (+ start 1) end)))
	(iter nil start end))

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))

(define (filter condition seq)
	(flatmap (lambda (x) (if (condition x) (list x) nil)) seq))

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))


(define (prime-sum-pairs n) 
	(map make-pair-sum
		(filter prime-sum? (flatmap (lambda (i)
							(map (lambda (j) (list i j)) 
								(enumerate-interval 1 (- i 1))))
							(enumerate-interval 1 n)))))
(define (unique-pairs n)
	(if (= n 1)
		nil
		(append 
			(unique-pairs (- n 1))
			(flatmap (lambda (x) (list (list n x))) (enumerate-interval 1 (- n 1)))
		)

	)
)

(define (prime-sum-pairs-new n)
	(map make-pair-sum 
		(filter prime-sum? (unique-pairs n))
	)
)

(define (main parameters)
	(print (unique-pairs 3))
	(print (prime-sum-pairs 6))
	(print (prime-sum-pairs-new 6))
	;(print (enumerate-interval 1 10))
)