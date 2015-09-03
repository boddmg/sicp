;<line x1="0" y1="0" x2="300" y2="300" style="stroke:rgb(99,99,99);stroke-width:2"/>
;</svg>
(load "48-segment.scm")
(load "38-fold.scm")
(use srfi-13)

(define (svg-create-context)
	"")

(define (render-context context proc)
	(proc context))

(define (svg-add-element element)
	(lambda (context) 
		(string-append context element)))

(define (svg-add-header)
	(svg-add-element 
		"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"100%\" height=\"100%\" version=\"1.1\">\r\n"))

(define (svg-add-end)
	(svg-add-element 
		"</svg>\r\n"))

(define (svg-add-elements-list elements-list)
	(lambda (context)
		(fold-left 
			(lambda (last-context new-proc) 
				(new-proc last-context))
			context
			elements-list)))

(define (svg-add-line segment)
	(svg-add-element 
		(string-append 
			"<line"
			" x1=\"" (number->string (xcor-vect (start-segment segment))) "\""
			" y1=\"" (number->string (ycor-vect (start-segment segment))) "\""
			" x2=\"" (number->string (xcor-vect (end-segment segment))) "\""
			" y2=\"" (number->string (ycor-vect (end-segment segment))) "\""
			" style=\"stroke:rgb(99,99,99);stroke-width:2\"></line>\r\n")))


(define write-string
    (lambda (s p)
		(let ((n (string-length s)))
			(do ((i 0 (+ i 1)))
			    ((= i n))
			    (write-char (string-ref s i) p))))) 

(define (main parameters)
	;(assert (= ))
	(write-string 
		(render-context 
			(svg-create-context)
			(svg-add-elements-list 
				(list 
					(svg-add-header)
					(svg-add-line 
						(make-segment 
							(make-vect 1 1) (make-vect 50 50)))
					(svg-add-end)
				)))
		(open-output-file "image.svg"))
)
