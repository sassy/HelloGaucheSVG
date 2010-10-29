(use gl)
(use gl.glut)
(load "./process_svg.scm")

(define setup-data
  (map 
   (lambda (x) (/ x 250))
   (parser "<svg><rect x='10' y='10' width='100' height='100' /></svg>")))


(define (disp)
  (let ((x setup-data))    
    (print x)
    (gl-clear-color 0.0 0.0 0.0 0.0)
    (gl-clear GL_COLOR_BUFFER_BIT)
    (gl-color 1.0 0.0 0.0)
    (gl-ortho 0.0 1.0 1.0 0.0 -1.0 1.0)
    (gl-begin GL_POLYGON)
    (gl-vertex (get_x1 x) (get_y1 x) 0.0)
    (gl-vertex (get_x2 x) (get_y1 x) 0.0)
    (gl-vertex (get_x2 x) (get_y2 x) 0.0)
    (gl-vertex (get_x1 x) (get_y2 x) 0.0)
    (gl-end)
    (gl-flush)))

(define (keyboard key x y)
  (cond
   ((= key 27) (exit 0))
   ))

(define (main args)
    (glut-init args)
    (glut-init-display-mode GLUT_SINGLE)
    (glut-init-window-size 250 250)
    (glut-create-window "nil window")
    (glut-display-func disp)
    (glut-keyboard-func keyboard)
    (glut-main-loop)
    0)
