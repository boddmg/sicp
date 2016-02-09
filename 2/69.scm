(load "68.scm")

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set 
         (make-leaf (car pair)    ; symbol
                    (cadr pair))  ; frequency
         (make-leaf-set (cdr pairs))))))

(define (length-of-set set)
	(length set))

(define (generate-huffmen-tree pairs)
	(successive-merge (make-leaf-set pairs)))

(define (successive-merge last-set)
	(if (= (length-of-set last-set) 1)
		(car last-set)
		(successive-merge 
      (adjoin-set 
        (make-code-tree
          (car last-set)
          (cadr last-set))
        (cddr last-set)))))

(define (main parameters)
  (let ((last-set (make-leaf-set '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1)) )))
    (print last-set)
    (print (successive-merge last-set))
  )
)
