; SLIME 2011-02-04
CL-USER> ((lambda(x y)(* x y)( 2 3))
	  )
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187A6AD6>.
CL-USER> ((lambda(x y)(* x y)) 2 3)
6
CL-USER> (let ((count 0))#'lambda()(1+ count))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x18796086>.
CL-USER> (let ((count 0))#'(lambda()(setf count (1+ count))))
#<CCL:COMPILED-LEXICAL-CLOSURE #x1882EFF6>
CL-USER> (defparameter *fn* (let ((count 0))#'(lambda()(setf count (1+ count)))))
*FN*
CL-USER> *fn*
#<CCL:COMPILED-LEXICAL-CLOSURE #x18863CCE>
CL-USER> (funcall *fn*)
1
CL-USER> (apply *fn*)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x187B0776>.
CL-USER> (funcall *fn*)
2
CL-USER> (let ((couhnt 0))
	   #'(lambda()(incf count))
	   #'(lambda()(decf count))
	   #'(lambda() count))
;Compiler warnings :
;   In an anonymous lambda form inside an anonymous lambda form: Undeclared free variable COUNT (2 references)
;   In an anonymous lambda form inside an anonymous lambda form: Undeclared free variable COUNT (2 references)
;   In an anonymous lambda form inside an anonymous lambda form: Undeclared free variable COUNT
;   In an anonymous lambda form: Unused lexical variable COUHNT
#<Anonymous Function #x18836C6E>
CL-USER> (let ((count 0))
	   (list
	    #'(lambda()(incf count))
	    #'(lambda()(decf count))
	    #'(lambda() count)))
Invoking restart: Kill this thread
(#<CCL:COMPILED-LEXICAL-CLOSURE #x18872F8E> #<CCL:COMPILED-LEXICAL-CLOSURE #x18872F66> #<CCL:COMPILED-LEXICAL-CLOSURE #x18872F3E>)
CL-USER> (defun foo(x)
	   (format t "parameter ~a~%" x)
	   ((let ((x 2))
	      (format t "outer ~a~%" x))
	      ((let ((x 3))
		 (format t "inner ~a~%" x))
	     (format t "parameter let ~a~%" x))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187F768E>.
CL-USER> (defun foo(x)
	   (format t "parameter: ~a~%" x)
	   (let ((x 2))
	     (format t "outer: ~a~%" x))
	   (let ((x 3))
	     (format t "inner: ~a~%" x))
	   (format t "outer let: ~a~%" x)
	   (format t "parameter let: ~a~%" x))
FOO
CL-USER> (foo 1)
parameter: 1
outer: 2
inner: 3
outer let: 1
parameter let: 1
NIL
CL-USER> (defun foo(x)
	   (format t "parameter: ~a~%" x)
	   (let ((x 2))
	     (format t "outer: ~a~%" x))
	   (let ((x 3))
	     (format t "inner: ~a~%" x)
	   (format t "outer let: ~a~%" x))
	   (format t "parameter let: ~a~%" x))
FOO
CL-USER> (foo 1)
parameter: 1
outer: 2
inner: 3
outer let: 3
parameter let: 1
NIL
CL-USER> (defun foo(x)
	   (format t "parameter: ~a~%" x)
	   (let ((x 2))
	     (format t "outer: ~a~%" x)
	   (let ((x 3))
	     (format t "inner: ~a~%" x))
	   (format t "outer let: ~a~%" x))
	   (format t "parameter let: ~a~%" x))
FOO
CL-USER> (foo 1)
parameter: 1
outer: 2
inner: 3
outer let: 2
parameter let: 1
NIL
CL-USER> (defparameter *fn* (let ((x 2))#'(lambda()(setf x (1+ x)))))
*FN*
CL-USER> (funcall *fn*)
3
CL-USER> (funcall *fn*(
		       ))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x188221C6>.
CL-USER> (funcall *fn*)
4
CL-USER> (dotimes(x 10)(format t "~d" x))
0123456789
NIL
CL-USER> (defun print-list(list)(dolist (i list)(format t "item: ~a~%")))
;Compiler warnings :
;   In PRINT-LIST: Missing argument in format string:
;   "item: ~a~%"
;           ^
;   
;   In PRINT-LIST: Unused lexical variable I
PRINT-LIST
CL-USER> (defun print-list(list)(dolist (i list)(format t "item: ~%")))
;Compiler warnings :
;   In PRINT-LIST: Unused lexical variable I
PRINT-LIST
CL-USER> (defun print-list(list)(dolist (i list)(format t "item: ~%" i)))
;Compiler warnings :
;   In PRINT-LIST: Too many format arguments in format string:
;   "item: ~%"
;    ^
;   
PRINT-LIST
CL-USER> (defun print-list(list)(dolist (i list)(format t "item: ~a~%" i)))
PRINT-LIST
CL-USER> (priint-list (list 1 2 3))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1883A136>.
CL-USER> (print-list (list 1 2 3))
item: 1
item: 2
item: 3
NIL
CL-USER> (defun foo(n)(dotimes (x 10)(dotimes(j 10)(when (> (* x j) n)(return-from foo(list x j))))))
FOO
CL-USER> (foo 23)
(3 8)
CL-USER> (let* ((x))(y (- x 10))(list x y))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function Y
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x188633D6>.
CL-USER> (let* ((x)(y (- x 10)))(list x y))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x18876486>.
CL-USER> (let* ((x 10)(y (- x 10)))(list x y))
(10 0)
CL-USER> (let ((x 10))(let y(+ x 10))(list x y))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1876D5AE>.
CL-USER> (let ((x 10)(let y(+ x 10)))(list x y))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x18786B6E>.
CL-USER> (let ((x 10))(let ((y (+ x 10)))(list x y)))
(10 20)
CL-USER> (defvar *db* C)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A8F26>.
CL-USER> (defvar *count* C)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187BE6FE>.
CL-USER> (defvar *count * C "count of widgets made so far")
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187DEDEE>.
CL-USER> (defparameter *gap-tolerance* 0.001)
*GAP-TOLERANCE*
CL-USER> (defparameter *gap-tolerance* 0.001 "give s a drink")
*GAP-TOLERANCE*
CL-USER> (defun increment-count()(incf *count*))
INCREMENT-COUNT
CL-USER> 