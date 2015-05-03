(load "3-representation2.scm")

(define (circumference-rectangle rectangle)
	(* (+ (car (length-rectangle rectangle)) (cdr (length-rectangle rectangle)) ) 2) )

(define (area-rectangle rectangle)
	(* (car (length-rectangle rectangle)) (cdr (length-rectangle rectangle)) ) )
