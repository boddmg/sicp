(define x 0)
(define (gcd a b)
  (print (begin 
           (set! x (+ x 1))
           x))
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (main arg)
	(gcd 206 40)
	)