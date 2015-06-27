(load "33-accumulate.scm")

(define (horner-eval x coefficient-sequence) 
	(accumulate (lambda (this-coeff higher-terms) (+ (* higher-terms x) this-coeff))
                    0
                    coefficient-sequence))

(define (main argv)
	(print (horner-eval 2 (list 1 1 1))))
