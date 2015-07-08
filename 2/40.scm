(define (prime-sum-pairs n) (map make-pair-sum
(filter prime-sum? (flatmap (lambda (i)
(map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))
                           (enumerate-interval 1 n)))))