; SLIME 2011-02-04
CL-USER> (defun free()(list "memory" "money" "marry"))
FREE
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (defun print-list(list)(dolist(i list)(format t "item:~a~%" i)))
PRINT-LIST
CL-USER> (print-list (list 1 2 3))
item:1
item:2
item:3
NIL
CL-USER> (let((x 10))(let ((y (- x 10)))(list x y)))
(10 0)
CL-USER> (let* ((x 10))(y(- x 10))(list x y))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function Y
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1878A2C6>.
CL-USER> (let* ((x 10)(y(- x 10))(list x y)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187A26CE>.
CL-USER> (let* ((x 10)(y(- x 10)))(list x y))
(10 0)
CL-USER> (let ((count 0))(list #'(lambda()((incf count))#'(lambda()(decf count))#'(lambda()(count)))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187C4F86>.
CL-USER> (let ((count 0))
	   (list
	    #'(lambda()(incf count))
	    #'(lambda()(decf count))
	    #'(lambda()(count))))
;Compiler warnings :
;   In an anonymous lambda form inside an anonymous lambda form: In the call to COUNT with arguments (),
;     0 arguments were provided, but at least 2 are required
;     by the current global definition of COUNT
(#<CCL:COMPILED-LEXICAL-CLOSURE #x18840306> #<CCL:COMPILED-LEXICAL-CLOSURE #x188402DE> #<Anonymous Function #x18847ADE>)
CL-USER> (let ((count 0))
	   (list
	    #'(lambda()(incf count))
	    #'(lambda()(decf count))
	    #'(lambda()count)))
(#<CCL:COMPILED-LEXICAL-CLOSURE #x188BFB26> #<CCL:COMPILED-LEXICAL-CLOSURE #x188BFAFE> #<CCL:COMPILED-LEXICAL-CLOSURE #x188BFAD6>)
CL-USER> (funcall count 0)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187DDA3E>.
CL-USER> (count)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x187F1C16>.
CL-USER> (defvar *count* C "count of widgets made so far.")
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1880374E>.
CL-USER> (defparameter *gap-toleraner* 0.001)
*GAP-TOLERANER*
CL-USER> (defvar *count* nil)
*COUNT*
CL-USER> (defvar *count*)
*COUNT*
CL-USER> (devar *count* "Give us a break")
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1881F9FE>.
CL-USER> (defvar *count*)
*COUNT*
CL-USER> (defvar *x* 10)
*X*
CL-USER> *x*
10
CL-USER> (defun foo()(format t "*x*: ~d~%" *x*))
FOO
CL-USER> (foo)
*x*: 10
NIL
CL-USER> (foo 1)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x188429E6>.
CL-USER> (defun foo()(format t "X: ~d~%" *x*))
FOO
CL-USER> (foo)
X: 10
NIL
CL-USER> (let ((x 20))(foo())
	      )
;Compiler warnings :
;   In an anonymous lambda form: In the call to FOO with arguments (NIL),
;     1 argument was provided, but at most 0 are accepted
;     by the current global definition of FOO
;   In an anonymous lambda form: Unused lexical variable X
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x1885A226>.
CL-USER> (let ((x 20))foo)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable FOO
;   In an anonymous lambda form: Unused lexical variable X
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x188737EE>.
CL-USER> (let ((*x* 20)) foo)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable FOO
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x1876EF86>.
CL-USER> (let ((*x* 20)) foo())
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable FOO
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x18780A4E>.
CL-USER> (let ((x* 20))(foo))
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable X*X: 10
NIL
CL-USER> (let ((*x* 20))(foo))
X: 20
NIL
CL-USER> (defun bar()(foo)(let ((*x* 20))(foo))(foo))
BAR
CL-USER> (bar)
X: 10
X: 20
X: 10
NIL
CL-USER> (defun foo()(format t "begin assignment~18tx: ~d~%" *x*)(setf *x* (1+ *x*))(format t "after assignment~18tx: ~d~%" *x*))
FOO
CL-USER> (foo)
begin assignment  x: 10
after assignment  x: 11
NIL
CL-USER> (foo)
begin assignment  x: 11
after assignment  x: 12
NIL
CL-USER> (bar)
begin assignment  x: 12
after assignment  x: 13
begin assignment  x: 20
after assignment  x: 21
begin assignment  x: 13
after assignment  x: 14
NIL
CL-USER> (bar)
begin assignment  x: 14
after assignment  x: 15
begin assignment  x: 20
after assignment  x: 21
begin assignment  x: 15
after assignment  x: 16
NIL
CL-USER> (defun foo()(format t "begin assignment~18tx: ~d~%" *x*)(setf *x* (+ 1 *x*))(format t "after assignment~18tx: ~d~%" *x*))
FOO
CL-USER> (foo)
begin assignment  x: 16
after assignment  x: 17
NIL
CL-USER> (bar)
begin assignment  x: 17
after assignment  x: 18
begin assignment  x: 20
after assignment  x: 21
begin assignment  x: 18
after assignment  x: 19
NIL
CL-USER> (defun (foo()
		    (format t "begin assignment~18tx: ~d~%" *x*)
		    (setf *x* (+ 1 *x*))
		    (format t "after assignment~18tx: ~d~%" *x*)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187A8DF6>.
CL-USER> (defun foo()
	   (format t "begin assignment~18tx: ~d~%" *x*)
	   (setf *x* (+ 1 *x*))
	   (format t "after assignment~18tx: ~d~%" *x*))
FOO
CL-USER> (foo)
begin assignment  x: 19
after assignment  x: 20
NIL
CL-USER> (bar)
begin assignment  x: 20
after assignment  x: 21
begin assignment  x: 20
after assignment  x: 21
begin assignment  x: 21
after assignment  x: 22
NIL
CL-USER> (defun foo()
	   (format t "begin assignment~1tx: ~d~%" *x*)
	   (setf *x* (+ 1 *x*))
	   (format t "after assignment~1tx: ~d~%" *x*))
FOO
CL-USER> (foo)
begin assignment x: 22
after assignment x: 23
NIL
CL-USER> (bar)
begin assignment x: 23
after assignment x: 24
begin assignment x: 20
after assignment x: 21
begin assignment x: 24
after assignment x: 25
NIL
CL-USER> (list "constant variable")
("constant variable")
CL-USER> (let ((x))
	   ((let ((x 2))
	      (format t "outer: ~a~%" x)
	      (let ((x 3))
		(format t "inner: ~a~%" x)
		(format t "inner let: ~a~%" x))
	      (format t "out let: ~a~%" x))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187E4716>.
CL-USER> (let ((x))
	   (let ((x 2))
	      (format t "outer: ~a~%" x)
	      (let ((x 3))
		(format t "inner: ~a~%" x)
		(format t "inner let: ~a~%" x))
	      (format t "out let: ~a~%" x)))
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable Xouter: 2
inner: 3
inner let: 3
out let: 2
NIL
CL-USER> (let ((x 1))
	   (let ((x 2))
	      (format t "outer: ~a~%" x)
	      (let ((x 3))
		(format t "inner: ~a~%" x)
		(format t "inner let: ~a~%" x))
	      (format t "out let: ~a~%" x)))
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable Xouter: 2
inner: 3
inner let: 3
out let: 2
NIL
CL-USER> (let ((x 1))
	   ((let ((x 2))
	      format t "outer: ~a~%" x)
	    (let ((x 3))
	      (format t "inner: ~a~%" x))
	    (format t "outer let: ~a~%" x))
	   (format t "x: ~a~%" x))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1880D63E>.
CL-USER> (defun foo(x)
	   (format t "parameter: ~a~%" x)
	   (let ((x 2))
	      (format t "out let: ~a~%" x)
	      (let ((x 3))
		 (format t "inner let: ~a~%" x))
	       (format t "outer let: ~a~%" x))
	      (format t "parameter: ~a~%" x))
FOO
CL-USER> (foo)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x1883C56E>.
CL-USER> (defun foo(x)
	   (format t "parameter: ~a~%" x)
	   (let ((x 2))
	     (format t "out let: ~a~%" x)
	   (let ((x 3))
	     (format t "inner let: ~a~%" x))
	   (format t "out let: ~a~%" x))
	   (format t "parameter ~a~%" x))
FOO
CL-USER> (foo 2)
parameter: 2
out let: 2
inner let: 3
out let: 2
parameter 2
NIL
CL-USER> (foo 1)
parameter: 1
out let: 2
inner let: 3
out let: 2
parameter 1
NIL
CL-USER> (defun foo(x)
	   (format t "x: ~a~%" x)
	   (format t "x: ~a~%" x))
FOO
CL-USER> (foo 2)
x: 2
x: 2
NIL
CL-USER> (let ((count 0))#'(lambda()(setf count (1+ count))))
#<CCL:COMPILED-LEXICAL-CLOSURE #x188B794E>
CL-USER> (defparameter *fn* (let ((count 0))#'(lambda()(setf count (1+ count)))))
*FN*
CL-USER> (funcall *fn*)
1
CL-USER> (funcall *fn*)
2
CL-USER> (let ((x 10))(let ((y(- x 10)))(list x y)))
(10 0)
CL-USER> (let* ((x 10))(y(- x 10))(list x y))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function Y
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x18865DF6>.
CL-USER> (let* ((x 10))(y(- x 10))(list x y))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function Y
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187855F6>.
CL-USER> (let* ((x 10))(y(- x 10)(list x y)))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function Y
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x18795E26>.
CL-USER> (let* ((x 10))(y(- x 10)))(list x y)
;Compiler warnings :
;   In an anonymous lambda form: Undefined function Y
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187A9A46>.
CL-USER> (let* ((x 10)(y(- x 10)))(list x y))
(10 0)
CL-USER> (let ((x 10))(let ((y(- x 10)))(list x y)))
(10 0)
CL-USER> (let* ((x 10)(y(- x 10)))(list x y))
(10 0)
CL-USER> (dotimes (i 10)(format t "~d~%" i))
0
1
2
3
4
5
6
7
8
9
NIL
CL-USER> (dotimes (i 10)(format t "~d" i))
0123456789
NIL
CL-USER> (dotimes (i 20)(format t "~d" i))
012345678910111213141516171819
NIL
CL-USER> (defvar *vrisc* 10)
*VRISC*
CL-USER> (*vrisc*)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187CAF76>.
CL-USER> *vrisc*
10
CL-USER> (defun foo(x)(foramt t "x: ~d~%" x))
;Compiler warnings :
;   In FOO: Undefined function FORAMT
FOO
CL-USER> (defun foo(x)(format t "x: ~d~%" x))
FOO
CL-USER> (foo 2)
x: 2
NIL
CL-USER> (let ((x 3))(setf x (+1 x)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187E640E>.
CL-USER> (defun foo(x)(format t "x: ~d~%" *vrisc*))
;Compiler warnings :
;   In FOO: Unused lexical variable X
FOO
CL-USER> (deffun foo()(format t "x: ~d~%" *vrisc*))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187FF99E>.
CL-USER> (defun foo()(format t "x: ~d~%" *vrisc*))
FOO
CL-USER> (foo)
x: 10
NIL
CL-USER> (foo)
x: 10
NIL
CL-USER> (let ((x 20))(foo))
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable Xx: 10
NIL
CL-USER> (let ((*vrisc* 20))(foo))
x: 20
NIL
CL-USER> (defun bar()
	   (foo)
	   (let ((*vrisc*))(foo))
	   (foo))
BAR
CL-USER> (bar)
x: 10
x: NIL
x: 10
NIL
CL-USER> (defun bar()
	   foo()
	   (let ((*vrisc* 30))(foo))
	   foo())
;Compiler warnings :
;   In BAR: Undeclared free variable FOO (2 references)
BAR
CL-USER> (defun bar()
	   (foo()
	       (let ((*vriscc* 30))(foo))
	       foo()))
;Compiler warnings :
;   In BAR: In the call to FOO with arguments (NIL (LET* ((*VRISCC* 30)) (FOO)) FOO NIL),
;     4 arguments were provided, but at most 0 are accepted
;     by the current global definition of FOO
;   In BAR: Unused lexical variable *VRISCC*
;   In BAR: Undeclared free variable FOO
BAR
CL-USER> (defun bar()
	   (foo)
	   (let ((*vrisc* 30))(foo))
	   (foo))
BAR
CL-USER> (bar)
x: 10
x: 30
x: 10
NIL
CL-USER> (defun bar()
	   (foo 3)
	   (let ((*vrisc* 30))(foo))
	   (foo 5))
;Compiler warnings :
;   In BAR: In the call to FOO with arguments (3),
;     1 argument was provided, but at most 0 are accepted
;     by the current global definition of FOO
;   In BAR: In the call to FOO with arguments (5),
;     1 argument was provided, but at most 0 are accepted
;     by the current global definition of FOO
BAR
CL-USER> (defun bar()
	   (foo)
	   (let ((*vriscc* 30))(foo))
	   (foo))
		   
;Compiler warnings :
;   In BAR: Unused lexical variable *VRISCC*
BAR
CL-USER> (defun bar()
	   (foo)
	   (let ((*vrisc* 30))(foo))
	   (foo))
		   
BAR
CL-USER> (bar)
x: 10
x: 30
x: 10
NIL
CL-USER> (defun foo()
	   (format t "before assignment~18tx: ~d~%" *vrisc*)(setf *vrisc* (+ 1 *vrisc*))(format t "after assignment~18tx: ~d~%" *vrisc*))
FOO
CL-USER> (foo)
before assignment x: 10
after assignment  x: 11
NIL
CL-USER> (bar)
before assignment x: 11
after assignment  x: 12
before assignment x: 30
after assignment  x: 31
before assignment x: 12
after assignment  x: 13
NIL
CL-USER> (bar)
before assignment x: 13
after assignment  x: 14
before assignment x: 30
after assignment  x: 31
before assignment x: 14
after assignment  x: 15
NIL
CL-USER> (defconstant *oslet*)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18822BC6>.
CL-USER> (defconstant *oslet* 10)
*OSLET*
CL-USER> (defconstant +oslet+ 10)
+OSLET+
CL-USER> (setf x 10)
10
CL-USER> (defun foo(x)(setf x 10))
;Compiler warnings :
;   In FOO: Unused lexical variable X
FOO
CL-USER> (let ((y 20))
	   (foo y)
	   (print y))

20 
20
CL-USER> (setf x 2)
2
CL-USER> (setf y 3)
3
CL-USER> (setf x 1 y 2)
2
CL-USER> (setf x (setf y(ramdom 10)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1884A7D6>.
CL-USER> (setf x(setf y (random 10)))
1
CL-USER> (setf x(setf y (random 10)))
0
CL-USER> (setf x(setf y (random 10)))
1
CL-USER> (setf x(setf y (random 10)))
0
CL-USER> (setf x(setf y (random 10)))
5
CL-USER> (setf x(setf y (random 10)))
8
CL-USER> (setf x(setf y (random 10)))
8
CL-USER> (setf x(setf y (random 10)))
0
CL-USER> (setf x(setf y (random 10)))
0
CL-USER> (setf x(setf y (random 10)))
7
CL-USER> (setf x(+ 1 x))
8
CL-USER> (setf x(+ 1 x))
9
CL-USER> (setf x(+ 1 x))
10
CL-USER> (setf x(+ 1 x))
11
CL-USER> (setf x(- x 1))
10
CL-USER> (setf x(- x 1))
9
CL-USER> (setf x(- x 1))
8
CL-USER> (setf x(- x 1))
7
CL-USER> (incf x)
8
CL-USER> (incf x)
9
CL-USER> (decf x)
8
CL-USER> (decf x)
7
CL-USER> (incf (x 10))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function X
;   In an anonymous lambda form: Undefined function (SETF X)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x188672BE>.
CL-USER> (incf x 10)
17
CL-USER> (decf x 10)
7
CL-USER> (incf arcf *array*(random (length *array*)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18878DEE>.
CL-USER> (incf aref *array* (random (length *array*)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187972D6>.
CL-USER> (rotatef a b)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable A (2 references)
;   In an anonymous lambda form: Undeclared free variable B (2 references)
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x187AFAE6>.
CL-USER> (setf a 10)
10
CL-USER> (setf b 20)
20
CL-USER> (rotatef a b)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable A (2 references)
;   In an anonymous lambda form: Undeclared free variable B (2 references)
NIL
CL-USER> (shiftf a b 10)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable A (2 references)
;   In an anonymous lambda form: Undeclared free variable B (2 references)
20
CL-USER> (defconstant a 10)
A
CL-USER> (defonstant b 20)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187C2D1E>.
CL-USER> (defconstant b 20)
B
CL-USER> (rotatef a b)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187DDA86>.
CL-USER> (list a b)
(10 20)
CL-USER> (shiftf a b)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187F506E>.
CL-USER> (shiftf a b 50)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1880CE36>.
CL-USER> (shiftf a b 10)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1882E6FE>.
CL-USER> 