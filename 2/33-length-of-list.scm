(load "33-accumulate.scm")
(load "utilities.scm")
(define (length sequence) (accumulate (lambda (x y) (+ y 1)) 0 sequence))

