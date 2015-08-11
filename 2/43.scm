(load "42.scm")

(define (queens board-size) 
	(define (queen-cols k)
		(if (= k 0)
		(list empty-board) 
		(filter
			(lambda (positions) (safe? k positions))
			(flatmap
				(lambda (new-row)
					(map 
						(lambda (rest-of-queens)
							(adjoin-position new-row k rest-of-queens))
				        (queen-cols (- k 1)))) ; For every new row, it will calculate with the queen-cols function.
				(enumerate-interval 1 board-size)))))
	(queen-cols board-size))

(define (main parameters)
	(print (queens 4))
)