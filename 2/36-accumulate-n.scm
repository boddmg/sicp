(load "33-accumulate.scm")
(load "utilities.scm")
(define (accumulate-n op init seqs) (if (null? (car seqs))
	nil
	(cons (accumulate op init (map (lambda (seq) (car seq)) seqs))
	(accumulate-n op init (map (lambda (seq) (cdr seq)) seqs)))))

(define (main parameters)
	(print (accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12))))
	; (22 26 30)
)