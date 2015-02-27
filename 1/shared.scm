(define printl print)
(define (make-num-list start end step . list-iter)
	(if ((if (> step 0) > <) start end)
		(if (null? list-iter)
			(list)
			(list-ref list-iter 0))
		(make-num-list (+ start step) end step 
			(if (null? list-iter)
				(list start)
				(append (list-ref list-iter 0) (list start))))))

