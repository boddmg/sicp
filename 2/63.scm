(load "63-tree.scm")
(load "utilities.scm")

(define (element-of-set? x set) 
	(cond 
		((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
	(cond 
		((null? set) (make-tree x '() '()))
		((= x (entry set)) set)
	    ((< x (entry set))
		    (make-tree (entry set)
				(adjoin-set x (left-branch set))
	            (right-branch set)))
	    ((> x (entry set))
			(make-tree (entry set) (left-branch set)
	            (adjoin-set x (right-branch set))))))

(define (tree->list-1 tree) 
	(if 
		(null? tree)
	    '()
		(append 
			(tree->list-1 (left-branch tree))
			(cons 
				(entry tree)
				(tree->list-1
					(right-branch tree))))))

(define (tree->list-2 tree)
	(define (copy-to-list tree result-list) 
		(if (null? tree)
	        result-list
	        (copy-to-list 
	        	(left-branch tree)
				(cons 
					(entry tree)
					(copy-to-list
                        (right-branch tree)
                        result-list)))))
	(copy-to-list tree '()))

(define (make-leaf x)
	(make-tree x nil nil))

(define tree->list tree->list-1)

(define (main parameters)
	(let 
		(
			(tree1 (make-tree 7 (make-tree 3 (make-tree 1 nil nil) (make-tree 5 nil nil)) (make-tree 9 nil (make-tree 11 nil nil))))
			(tree2 (make-tree 3 (make-leaf 1) (make-tree 7 (make-leaf 5) (make-tree 9 nil (make-leaf 11)))))
			(tree3 (make-tree 5 (make-tree 3 (make-leaf 1) nil) (make-tree 9 (make-leaf 7) (make-leaf 11)))))
			(print tree1)
		(print (tree->list-1 tree1))
		(print (tree->list-2 tree1))
		(print tree2)
		(print (tree->list-1 tree2))
		(print (tree->list-2 tree2))
		(print tree3)
		(print (tree->list-1 tree3))
		(print (tree->list-2 tree3))
		)
)

;a.They have the same order of the list produced from the tree, all are in the order from the left to the right.
;b.Yes, they have the same order of growth in the number of steps.
