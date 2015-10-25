(load "64.scm")

(define (union-set set1 set2)
	(let ((set2-list (tree->list set2)))
		(if (null? set2-list)
			set1
			(union-set 
				(adjoin-set (car set2-list) set1)
				(list->tree (cdr set2-list))))))

(define (intersection-set set1 set2)
	(define temp-set '())
	(map 
		(lambda (element) 
			(if (element-of-set? element set1)
				(set! temp-set
					(adjoin-set element temp-set))
				nil))
		(tree->list set2))
	temp-set)

(define (main parameters)
	(define set1 (list->tree '(1 2 3 4)))
	(define set2 (list->tree '(4 5 6 7 8)))
	(define set3 (list->tree '(1 2 3 4 5 6 7 8)))
	(print set3)
	(print (tree->list set3))
	(print (tree->list (union-set set1 set2)))
	(print (intersection-set set1 set2))
)
