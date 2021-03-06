(use sxml.ssax)
  
(define (translation_rect data)
  (let ((x1 0)
	(y1 0)
	(x2 0)
	(y2 0))
    (map (lambda (x)
	   (cond 
	    ((equal? (car x) 'x) 
	     (set! x1 (string->number (cadr x)))
	     (set! x2 (+ x2  (string->number (cadr x)))))
	    ((equal? (car x) 'y) 
	     (set! y1 (string->number (cadr x)))
	     (set! y2 (+ y2 (string->number (cadr x)))))
	    ((equal? (car x) 'width) 
	     (set! x2 (+ x2 (string->number (cadr x)))))
	    ((equal? (car x) 'height) 
	     (set! y2 (+ y2 (string->number (cadr x)))))
	    ))
	 data)
    (list x1 y1 x2 y2)))

(define (get_x1 data)
  (car data))
(define (get_x2 data)
  (caddr data))
(define (get_y1 data)
  (cadr data))
(define (get_y2 data)
  (cadddr data))

(define (process_element elem)
  (case (car elem)
    ('rect (translation_rect (cdr (cadr elem))))
    ('circle (print "circle"))
    ('line (print "line"))))

(define (parser data) 
  (process_element 
   (car (cdr (car (cdr (ssax:xml->sxml (open-input-string data) '())))))))

