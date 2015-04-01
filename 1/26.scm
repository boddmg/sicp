(load "24.scm")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder 
            (* base (expmod base (- exp 1) m))
            m))))

; The expand of the recursive will become very complex.