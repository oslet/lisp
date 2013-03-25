; SLIME 2011-02-04
CL-USER> (defun print-list(list)(dolist (i list)(format t "item: ~a~%" i)))
PRINT-LIST
CL-USER> (pirnt-list (list 1 2 3))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187A07B6>.
CL-USER> (print-list (list 1 2 3))
item: 1
item: 2
item: 3
NIL
CL-USER> (defun foo(n)(dotmes ( i 10)(dotimes j 10)(when (> (* i j) n)(return-from foo(list i j)))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1879137E>.
CL-USER> (defun foo(n)
	   (dotimes (i 10)
	     (dotimes (j 10)
	       (when (> (* i j) n)
		 (return-from foo(list i j))))))
FOO
CL-USER> (foo 23)
(3 8)
CL-USER> (defun foo()(list 1 2 3))
FOO
CL-USER> (foo 1 2 3)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x187B4ACE>.
CL-USER> (foo)
(1 2 3)
CL-USER> #'foo
#<Compiled-function FOO #x187B501E>
CL-USER> (defun foo(x)(* x 2))
FOO
CL-USER> (foo 1 2 3)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x187CC3DE>.
CL-USER> #'foo
#<Compiled-function FOO #x187C4C2E>
CL-USER> (funcall #'foo 1 2 3)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x187DAB2E>.
CL-USER> (defun plot(fn min max step)(loop for i from min to max by step do (loop repeat (funcall fn i)(format t "*")(format t "~%"))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187F95BE>.
CL-USER> (defun plot(fn min max step)
	   (loop for i from min to max by step do
		(loop repeat (funcall fn i)
		     (format t "*")
		     (format t "~%"))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1881A906>.
CL-USER> (defun plot(fn min max step)
	   (loop for i from min to max by step do
		(loop repeat (funcall fn i)
		     (format t "*"))
		     (format t "~%")))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18837B46>.
CL-USER> (defun plot(fn min max step)
	   (loop for i from min to max by step do
		(loop repeat (funcall fn i)(format t "*"))
		(format t "~%")))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18851E46>.
CL-USER> (defun plot(fn min max step)
	   (loop for i from min to max by step do
		(loop repeat (funcall fn i)(format t "*"))
		(format t "~%")))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1887055E>.
CL-USER> (defun plot(fn min max step)
	   (loop for i from min to max by step do
		(loop repeat (funcall fn i) do (format t "*"))
		(format t "~%")))
PLOT
CL-USER> (plot #'exp(1 2 4 5))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1876FCAE>.
CL-USER> (plot #'exp 1 2 4)
**
NIL
CL-USER> (plot #'exp 4 2 1/2)
NIL
CL-USER> (plot #'exp 0 4 1/2)
*
*
**
****
*******
************
********************
*********************************
******************************************************
NIL
CL-USER> (apple plot plot-data)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1878D6BE>.
CL-USER> (apply #'plot plot-data)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A1566>.
CL-USER> (apply #'plot plot-data)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187B7726>.
CL-USER> (apply plot #'exp plot-data)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187CAE5E>.
CL-USER> (funcall #'(lambda(x)(+ x y)( 2 3)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187E2BCE>.
CL-USER> (funcall #'(lambda(x)(+ x y)) 2 3)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x187F70F6>.
CL-USER> (funcall #'lambda(x y)(+ x y)2 3)
Invoking restart: Kill this thread
; Evaluation aborted on #<UNDEFINED-FUNCTION #x18805F16>.
CL-USER> (funcall #'(lambda(x y)(+ x y)) 2 3)
5
CL-USER> ((lambda(x)(+ x y)) 2 3)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x18823E2E>.
CL-USER> ((lambda(x y)(+ x y)) 2 3 )
5
CL-USER> (defun double(x)(* x 2))
DOUBLE
CL-USER> (plot #'double 0 10 1)

**
****
******
********
**********
************
**************
****************
******************
********************
NIL
CL-USER> (plot #'(lambda(x)(* x 2) 0 10 1))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x1883A146>.
CL-USER> (plot #'(lambda(x)(* x 2)) 0 10 1)

**
****
******
********
**********
************
**************
****************
******************
********************
NIL
CL-USER> (defun plot(fn min max step)(loop for i from min to max by step do (loop (funcall fn i))(format t "*")(format t "~%")))
PLOT
CL-USER> (defun plot(fn min max step)(llop for i form min to max by step do (loop repeat(funcall fn i) do (format t "*"))(format t "~%")))
;Compiler warnings :
;   In PLOT: Undefined function LLOP
;   In PLOT: Undeclared free variable FOR
;   In PLOT: Undeclared free variable FORM
;   In PLOT: Undeclared free variable TO
;   In PLOT: Undeclared free variable BY
;   In PLOT: Undeclared free variable DO
;   In PLOT: Undeclared free variable I (2 references)
PLOT
CL-USER> (defun plot(fn min max step)(loop for i from min to max by step do (loop repeat(funcall fn i) do (format t "*"))(format t "~%")))
PLOT
CL-USER> ((lambda(x y)(+ x y)) 2 3)
5
CL-USER> (funcall #'(lambda(x y)(+ x y)) 2 3)
5
CL-USER> (plot #'(lambda(x)(* x 2) 0 10 1))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x1878D87E>.
CL-USER> (plot #'(lambda(x)(* x 2)) 0 10 1)

**
****
******
********
**********
************
**************
****************
******************
********************
NIL
CL-USER> (+ a 1)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A6F4E>.
CL-USER> 