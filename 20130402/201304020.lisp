; SLIME 2011-02-04
CL-USER> (setf x 1 y 2)
2
CL-USER> (defun foo()(rotatef a b)(list a b))
;Compiler warnings :
;   In FOO: Undeclared free variable A (3 references)
;   In FOO: Undeclared free variable B (3 references)
FOO
CL-USER> (defparameter a 10)
A
CL-USER> (defparameter b 20)
B
CL-USER> (defun foo()(rotatef a b)(list a b))
FOO
CL-USER> (foo)
(20 10)
CL-USER> (foo)
(10 20)
CL-USER> (shiftf a b 100)
10
CL-USER> (shiftf a b 100)
20
CL-USER> (shiftf a b 100)
100
CL-USER> (set x 1 y 2)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x1878894E>.
CL-USER> (setf x 1 y 2)
2
CL-USER> (setf x (setf y (random x)))
0
CL-USER> (setf x (setf y (random x)))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187AEC76>.
CL-USER> (setf x 9 y 8)
8
CL-USER> (setf x (setf y (random x)))
1
CL-USER> (setf x (setf y (random x)))
0
CL-USER> (setf x (setf y (random x)))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187BF81E>.
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
CL-USER> (dotimes (i 100)(format t "~d" i))
0123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899
NIL
CL-USER> (defun foo(x)(dotimes (i 10)(dotimes (j 10)(when (> (* i j) x)(return-from foo(list i j))))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187E7096>.
CL-USER> (defun foo(x)(dotimes (i 10)(dotimes (j 10)(when (> (* i j) x)(return-from foo(list i j))))))
FOO
CL-USER> (foo 5)
(1 6)
CL-USER> (defun foo(x)
	   (format t "parameter: ~a~%" x)
	   (let ((x 2))
	     (format t "outer let: ~a~%" x)
	     (let ((x 3))
	       (format t "inner let: ~a~%" x))
	     (format t "outer let: ~a~%" x))
	   (format t "parameter let: ~a~%" x))
FOO
CL-USER> (foo 5)
parameter: 5
outer let: 2
inner let: 3
outer let: 2
parameter let: 5
NIL
CL-USER> (let* (x 10)(y(- x 10)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x188105DE>.
CL-USER> (let* ((x 10)(y(- x 10)))(list x y))
(10 0)
CL-USER> (let ((x 10))(let ((y(- x 10))(list x y))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1882AC7E>.
CL-USER> (let ((x 10))(let ((y (- x 10)))(list x y)))
(10 0)
CL-USER> (defparameter *fn* (let ((count 0)#'(lambda()(setf count (1+ count))))))
;Compiler warnings :
;   In an anonymous lambda form inside an anonymous lambda form: Undeclared free variable COUNT (2 references)
;   In an anonymous lambda form: Unused lexical variable FUNCTION
;   In an anonymous lambda form: Unused lexical variable COUNT
*FN*
CL-USER> (defparameter *count*)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1884367E>.
CL-USER> (defparameter *count* "this is a test value")
*COUNT*
CL-USER> (defparameter *fn* (let ((count 0))#'(lambda()(setf count(1+ count)))))
*FN*
CL-USER> (funcall *fn*)
1
CL-USER> (funcall *fn*)
2
CL-USER> (funcall *fn*)
3
CL-USER> (let ((count 0))
	  (list
	   #'(lambda()(incf count))
	   #'(lambda()(decf count))
	   #'(lambda()count)))
(#<CCL:COMPILED-LEXICAL-CLOSURE #x188B444E> #<CCL:COMPILED-LEXICAL-CLOSURE #x188B4426> #<CCL:COMPILED-LEXICAL-CLOSURE #x188B43FE>)
CL-USER> (defun *x* 10)
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1886441E>.
CL-USER> (defvar *x* 10)
*X*
CL-USER> (let ((*x* ))(format t "x: ~d~%" *x*))
x: NIL
NIL
CL-USER> (defun foo()(format t "x: ~d~%" *x*))
FOO
CL-USER> (foo)
x: 10
NIL
CL-USER> (let ((*x* 20))(format t "x: ~d~%" *x*))
x: 20
NIL
CL-USER> (defun bar()(foo)(let ((*x* 20))(format t "x: ~d~%" *x*))(foo))
BAR
CL-USER> (bar)
x: 10
x: 20
x: 10
NIL
CL-USER> (defun foo()
	   (format t "before assingment~18tx: ~a~%" *x*)
	   (setf *x* (+ 1 *x*))
	   (format t "after assingment~18tx: ~a~%" *x*))
FOO
CL-USER> (bar)
before assingment x: 10
after assingment  x: 11
x: 20
before assingment x: 11
after assingment  x: 12
NIL
CL-USER> (bar)
before assingment x: 12
after assingment  x: 13
x: 20
before assingment x: 13
after assingment  x: 14
NIL
CL-USER> 