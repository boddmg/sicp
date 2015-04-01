(load "16.scm")

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
; Muling and dividing a big number is a waste of time. 

(define (main parameters)
  (expmod 3 31 100))