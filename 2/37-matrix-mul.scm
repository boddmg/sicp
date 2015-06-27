(load "36-accumulate-n.scm")

(define (scalar-*-vector s v)
	(map (lambda (x) (* s x)) v))

(define (dot-product v w)
      (accumulate + 0 (map * v w)))

(define (transpose mat) (accumulate-n (lambda (new old) (cons new old)) (list) mat))

(define (matrix-*-vector m v) 
	(map (lambda (row) (dot-product v row)) m))

(define (matrix-*-matrix m n) 
	(let ((cols (transpose n)))
		(map (lambda (m-row) 
			(accumulate (lambda (new old) 
				(cons (dot-product m-row new) old)) nil cols)) m)))

(define (main argv)
	(print (dot-product (list 1 2 3) (list 1 1 1)))
	(print (transpose (list (list 1 1 1) (list 2 2 2) (list 3 3 3))))
	(print (matrix-*-vector (list (list 1 1 1) (list 2 2 2) (list 3 3 3)) (list 1 1 1)))
	(print (matrix-*-matrix 
		(list (list 1 1 1) (list 2 2 2) (list 3 3 3)) 
		(list (list 1 2) (list 1 2) (list 1 2))))

)