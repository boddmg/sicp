(define (tree-map tree proc) 
	(map (lambda (sub-tree)
	(if (pair? sub-tree) 
		(tree-map sub-tree proc) 
		(proc sub-tree)))
	tree))

(define (square-tree tree)
	(tree-map tree (lambda (x) (* x x))))


(define (main parameters)
	(print (square-tree
		(list 1
			(list 2 (list 3 4) 5)
			(list 6 7))))
	;(1 (4 (9 16) 25) (36 49))
)