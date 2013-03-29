; SLIME 2011-02-04
CL-USER> (let* ((x 10) (y(- x 10)))(list x y))
(10 0)
CL-USER> (let ((x 10)(let ((y (+ x 10)))(list x y))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x18787296>.
CL-USER> (let ((x 10))(let ((y(+ x 10)))(list x y)))
(10 20)
CL-USER> (defvar *count* C)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187AAE76>.
CL-USER> (defparameter *fn* #'(lambda()(setf count (1+ count))))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable COUNT (2 references)
*FN*
CL-USER> (defvar *count*)
*COUNT*
CL-USER> (defparameter *fn* #'(lambda()(setf count(1+ count))))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable COUNT (2 references)
*FN*
CL-USER> (funcall *fn*)
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x187C6F7E>.
CL-USER> (defparameter *fn* #'(lambda()(setf count (1+ count))))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable COUNT (2 references)
*FN*
CL-USER> (defparameter *count* "give us a message")
*COUNT*
CL-USER> (defpmrameter *fn* #'(lambda()(setf count (1+ count))))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable COUNT (2 references)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187E7D5E>.
CL-USER> (defparameter *fn* (let ((count 0))#'(lambda()(setf count (1+ count)))))
*FN*
CL-USER> (funcall *fn*)
1
CL-USER> (funcall *fn*)
2
CL-USER> (funcall *fn*)
3
CL-USER> (funcall *fn*)
4
CL-USER> (let ((count 0))#'(lambda()(setf count (1+ count))))
#<CCL:COMPILED-LEXICAL-CLOSURE #x188AB43E>
CL-USER> (defun incrment-widgets-count()(incf *count*))
INCRMENT-WIDGETS-COUNT
CL-USER> (defun increment-widgets-count()(incf *count*))
INCREMENT-WIDGETS-COUNT
CL-USER> (let((*standard-output* *other-output*))(stuff))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable *OTHER-OUTPUT*
;   In an anonymous lambda form: Undefined function STUFF
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x18808C5E>.
CL-USER> (defvar *x* 10)
*X*
CL-USER> (defun foo()(format t "X: ~a~%" *x*))
FOO
CL-USER> (foo)
X: 10
NIL
CL-USER> (let((*x* 20))(foo))
X: 20
NIL
CL-USER> (foo)
X: 10
NIL
CL-USER> (defun bar()(foo)(let ((*x* 10))(foo))(foo))
BAR
CL-USER> (bar)
X: 10
X: 10
X: 10
NIL
CL-USER> (defun bar()(foo)(let ((*x* 20))(foo))(foo))
BAR
CL-USER> (bar)
X: 10
X: 20
X: 10
NIL
CL-USER> (defun foo()(format t "before assignment~18tx: ~a~%" *x*)
		(setf *x* (1+ *x*)
		      (format t "after assignment~18tx: ~a~%" *x*)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1882EC1E>.
CL-USER> (defun foo()(format t "before assignment~18tx: ~d~%" *x*)
		(setf *x* (+ 1 *x*))
		(format t "after assignment~18tx: ~d~%" *x*))
FOO
CL-USER> (foo)
before assignment x: 10
after assignment  x: 11
NIL
CL-USER> (bar)
before assignment x: 11
after assignment  x: 12
before assignment x: 20
after assignment  x: 21
before assignment x: 12
after assignment  x: 13
NIL
CL-USER> (bar)
before assignment x: 13
after assignment  x: 14
before assignment x: 20
after assignment  x: 21
before assignment x: 14
after assignment  x: 15
NIL
CL-USER> '你好

; No value
CL-USER> #'你好

; No value
CL-USER> `你好

; No value
CL-USER> `(你好)

; No value
CL-USER> `a
A
CL-USER> `vb
VB
CL-USER> `go
GO
CL-USER> `c
C
CL-USER> `lisp
LISP
CL-USER> 