(load "utilities.scm")
(load "40.scm")

(define empty-board nil)

(define (two-queen-fight? queen1 queen2)
	(and
		(not (= (car queen1) (car queen2)))
		(not (= (cdr queen1) (cdr queen2)))
		(not (= 
			(abs (- (car queen1) (car queen2)))
			(abs (- (cdr queen1) (cdr queen2)))))
	)
)

(define (safe? k positions)
	;(print positions)
	(if (= k 1) 
		#t
		(accumulate (lambda (x y) (and x y)) #t
			(map 
				(lambda (x) 
					(two-queen-fight? (car positions) x))
				(cdr positions)))))

(define (adjoin-position y x last-positions)
	(append
		(list (cons x y))
		last-positions))


(define (queens board-size) 
	(define (queen-cols k)
		(if (= k 0)
		(list empty-board) 
		(filter
			(lambda (positions) (safe? k positions))
			(flatmap
				(lambda (rest-of-queens) 
					(map 
						(lambda (new-row)
                   			(adjoin-position new-row k rest-of-queens))
                 		(enumerate-interval 1 board-size)))
          		(queen-cols (- k 1))))))
	(queen-cols board-size))


(define (main parameters)
	(print (queens 4))
)