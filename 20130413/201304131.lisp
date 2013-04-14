CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((ending-value ,end)(,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ending-value)) ,@body))
;Compiler warnings :
;   In DO-PRIMES: Undeclared free variable ENDING-VALUE
DO-PRIMES
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((ending-value ,end)(,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ending-value)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 
NIL
CL-USER> 
; No value
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (defmacro do-primes((var start end) &body body)(let (ending-value-name (gensym)))`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))(,ending-value-name ,end)((> ,ending-value-name ,end)) ,@body))
;Compiler warnings :
;   In DO-PRIMES: Unused lexical variable GENSYM
;   In DO-PRIMES: Unused lexical variable ENDING-VALUE-NAME
;   In DO-PRIMES: Undeclared free variable ENDING-VALUE-NAME (2 references)
DO-PRIMES
CL-USER> (defmacro do-primes ((var start end) &body body)(let ((ending-value-name (gensym)))`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)),@body)))
DO-PRIMES
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (macroexpand-1 '(do-primes (p 0 (random 100))(format t "~d " p)))
(DO ((P (NEXT-PRIME 0) (NEXT-PRIME (1+ P))) (#:G124 (RANDOM 100))) ((> P #:G124)) (FORMAT T "~d " P))
T
CL-USER> (do-times (x 9)(dotimes (y 9)(* (1+ x)(1+ y)(format t "~3d " )(format t "~%")
					 )))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x188CCFDE>.
CL-USER> (dotimes(x 9)(dotimes (y 9)(format t "~3d " (* (1+ x)(1+ y)))(format t "~%")))
  1 
  2 
  3 
  4 
  5 
  6 
  7 
  8 
  9 
  2 
  4 
  6 
  8 
 10 
 12 
 14 
 16 
 18 
  3 
  6 
  9 
 12 
 15 
 18 
 21 
 24 
 27 
  4 
  8 
 12 
 16 
 20 
 24 
 28 
 32 
 36 
  5 
 10 
 15 
 20 
 25 
 30 
 35 
 40 
 45 
  6 
 12 
 18 
 24 
 30 
 36 
 42 
 48 
 54 
  7 
 14 
 21 
 28 
 35 
 42 
 49 
 56 
 63 
  8 
 16 
 24 
 32 
 40 
 48 
 56 
 64 
 72 
  9 
 18 
 27 
 36 
 45 
 54 
 63 
 72 
 81 
NIL
CL-USER> (dotimes(x 9)(dotimes (y 9)(format t "~3d " (* (1+ x)(1+ y)))
			       ))
  1   2   3   4   5   6   7   8   9   2   4   6   8  10  12  14  16  18   3   6   9  12  15  18  21  24  27   4   8  12  16  20  24  28  32  36   5  10  15  20  25  30  35  40  45   6  12  18  24  30  36  42  48  54   7  14  21  28  35  42  49  56  63   8  16  24  32  40  48  56  64  72   9  18  27  36  45  54  63  72  81 
NIL
CL-USER> (dotimes (x 9)(dotimess (y 9)(format t "~3d " (* (1+ x)(1+ y))))(format t "~d"))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function DOTIMESS
;   In an anonymous lambda form: Undefined function Y
;   In an anonymous lambda form: Undeclared free variable Y
;   In an anonymous lambda form: Missing argument in format string:
;   "~d"
;     ^
;   
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x188EC826>.
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d " (* (1+ x)(1+ y))))(format t "~d"))
;Compiler warnings :
;   In an anonymous lambda form: Missing argument in format string:
;   "~d"
;     ^
;     1   2   3   4   5   6   7   8   9 
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x1882688E>.
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d " (* (1+ x)(1+ y))))(format t "~%"))
  1   2   3   4   5   6   7   8   9 
  2   4   6   8  10  12  14  16  18 
  3   6   9  12  15  18  21  24  27 
  4   8  12  16  20  24  28  32  36 
  5  10  15  20  25  30  35  40  45 
  6  12  18  24  30  36  42  48  54 
  7  14  21  28  35  42  49  56  63 
  8  16  24  32  40  48  56  64  72 
  9  18  27  36  45  54  63  72  81 
NIL
CL-USER> (dolist (i '(1 2 3 4 5 6))(print i))

1 
2 
3 
4 
5 
6 
NIL
CL-USER> (dolist (i '(1 2 3 4 5 6))(format t "~d " i))
1 2 3 4 5 6 
NIL
CL-USER> (dolist (i '(1 2 3 4 5 6))(format t "~d  " i))
1  2  3  4  5  6  
NIL
CL-USER> (dotimes (i 4)(print i))

0 
1 
2 
3 
NIL
CL-USER> (dotimes (i 4)(format t "~d " i))
0 1 2 3 
NIL
CL-USER> (dotimes (i 4)(format t "~d~% " i))
0
 1
 2
 3
 
NIL
CL-USER> (dotimes (i 4)(format t "~d~%" i))
0
1
2
3
NIL
CL-USER> (defmacro ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(ending-value-name ,end))((> ,var ,ending-value-name)),@body)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1885101E>.
CL-USER> (defmacro ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(ending-value-name ,end))((> ,var ,ending-value-name)),@body)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18868DD6>.
CL-USER> (defmacro ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(ending-value-name ,end))((> ,var ending-value-name)),@body)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18889B86>.
CL-USER> (defmacro ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ending-value-name)),@body)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188A3BC6>.
CL-USER> (defmacro with-gensyms((&rest names) &body body)`(let ,(loop for n in names collect `(,n (gensym))) ,@body))
WITH-GENSYMS
CL-USER> (defmacro ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ending-value-name)),@body)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18913BEE>.
CL-USER> (defmacro ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)) ,@body)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1883BB56>.
CL-USER> (defmacro do-primes((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)(,ending-value-name ,end))))((,var ,ending-value-name)) ,@body)))
DO-PRIMES
CL-USER> (do-primes (p 0 100)(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: In the call to NEXT-PRIME with arguments ((CCL::+-2 1 P) (#:G10 100)),
;     2 arguments were provided, but at most 1 is accepted
;     by the current global definition of NEXT-PRIME
;   In an anonymous lambda form: Undefined function #:G10
;   In an anonymous lambda form: Undefined function P
;   In an anonymous lambda form: Undeclared free variable #:G10
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x1885ACBE>.
CL-USER> (defmacro do-primes((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime  )(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name))) ,@body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x188773C6>.
CL-USER> (defmacro do-primes((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name))) ,@body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x18898DB6>.
CL-USER> (defmacro do-primes ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)),@body)))
DO-PRIMES
CL-USER> (do-primes (p 0 100)(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (do-primes (p 0 100)(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (do-primes (p 0 random(100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (do-primes (p 0 random(100))(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188BA7AE>.
CL-USER> (do-primes (p 0 random(100))(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188D46A6>.
CL-USER> (loop for n in '(a b c) collect `(,n (gensym)))
((A (GENSYM)) (B (GENSYM)) (C (GENSYM)))
CL-USER> (let ((x 1))(let ((y 2)))
	      )
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable Y
;   In an anonymous lambda form: Unused lexical variable X
NIL
CL-USER> (let ((x 1)))
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable X
NIL
CL-USER> (let ((x 1))(let ((y 2))))
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable Y
;   In an anonymous lambda form: Unused lexical variable X
NIL
CL-USER> (let ((= x 1)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x188F5E36>.
CL-USER> (let* ((x 10)(y (+ x 10)))(list x y))
(10 20)
CL-USER> (let ((x 1))(let ((y 2)))(list x y))
;Compiler warnings :
;   In an anonymous lambda form: Unused lexical variable Y
;   In an anonymous lambda form: Undeclared free variable Y
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x1890B366>.
CL-USER> (let ((x 10)let ((y(+ x 10)))(list x y))
	   )
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x189235FE>.
CL-USER> (let ((x 10)(let ((y (+ x 10))))(list x y)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1893FEC6>.
CL-USER> (let ((x 10))(let ((y (+ x 10)))(list x y)))
(10 20)
CL-USER> (setf x 1 y 2 z 3)(list x y z)
(1 2 3)
CL-USER> (= (+ 1 2) 3)
T
CL-USER> (= (+ 1 2) 4)
NIL
CL-USER> (defun test-+()(and (= (+ 1 2) 3)(= (+ 1 2 3) 6)(= (+ (-1 -3) -4))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x18855626>.
CL-USER> (defun test-+()(and (= (+ 1 2) 3)(= (+ 1 2 3) 6)(= (+ -1 -3) -4)))
TEST-+
CL-USER> (test-+)
T
CL-USER> (test-+)
T
CL-USER> (defun test-+()(format t "~: [fail~;pass~]...~%" (= (+ 1 2) 3))(format t "~: [fail~;pass~]...~%" (= (+ 1 2 3) 6))(format t "~: [fail~;pass~]...~%" (= (+ -1 =3) -4)))
;Compiler warnings :
;   In TEST-+: Unknown directive   in format string:
;   "~: [fail~;pass~]...~%"
;      ^
;   
;   In TEST-+: Unknown directive   in format string:
;   "~: [fail~;pass~]...~%"
;      ^
;   
;   In TEST-+: Unknown directive   in format string:
;   "~: [fail~;pass~]...~%"
;      ^
;   
;   In TEST-+: Undeclared free variable =3
TEST-+
CL-USER> (defun test-+()(format t "~: [fail~;pass~]...~a~%" (= (+ 1 2) 3))(format t "~: [fail~;pass~]...~a~%" (= (+ 1 2 3) 6))(format t "~: [fail~;pass~]...~a~%" (= (+ -1 =3) -4)))
;Compiler warnings :
;   In TEST-+: Unknown directive   in format string:
;   "~: [fail~;pass~]...~a~%"
;      ^
;   
;   In TEST-+: Unknown directive   in format string:
;   "~: [fail~;pass~]...~a~%"
;      ^
;   
;   In TEST-+: Unknown directive   in format string:
;   "~: [fail~;pass~]...~a~%"
;      ^
;   
;   In TEST-+: Undeclared free variable =3
TEST-+
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 =3) -4)))
;Compiler warnings :
;   In TEST-+: Missing argument in format string:
;   "~:[fail~;pass~]...~a~%"
;                       ^
;   
;   In TEST-+: Missing argument in format string:
;   "~:[fail~;pass~]...~a~%"
;                       ^
;   
;   In TEST-+: Missing argument in format string:
;   "~:[fail~;pass~]...~a~%"
;                       ^
;   
;   In TEST-+: Undeclared free variable =3
TEST-+
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 =3) -4)'(= (+ -1 -3) -4)))
;Compiler warnings :
;   In TEST-+: Undeclared free variable =3
TEST-+
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
TEST-+
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
NIL
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -5)))
TEST-+
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -5)
NIL
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 4)'(= (+ 1 2) 4))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
TEST-+
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 4)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
TEST-+
CL-USER> (test-+)
fail...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
NIL
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 4)'(= (+ 1 2) 4))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
TEST-+
CL-USER> (test-+)
fail...(= (+ 1 2) 4)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
NIL
CL-USER> (defun report-result(result form)(format t "~:[fail~;pass~]...~a~%" result form))
REPORT-RESULT
CL-USER> (defun test-+()(report-result (= (+ 1 2) 3))(report-result (= (+ 1 2 3) 6))(report-result (= (+ -1 -3) -4)))
;Compiler warnings :
;   In TEST-+: In the call to REPORT-RESULT with arguments (T),
;     1 argument was provided, but at least 2 are required
;     by the current global definition of REPORT-RESULT
;   In TEST-+: In the call to REPORT-RESULT with arguments (T),
;     1 argument was provided, but at least 2 are required
;     by the current global definition of REPORT-RESULT
;   In TEST-+: In the call to REPORT-RESULT with arguments (T),
;     1 argument was provided, but at least 2 are required
;     by the current global definition of REPORT-RESULT
TEST-+
CL-USER> (test-+)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x1889B2FE>.(test-+)(defun test-+()(report-result (= (+ 1 2) 3))(report-result (= (+ 1 2 3) 6))(report-result (= (+ -1 -3) -4)))(defun report-result(result form)(format t "~:[fail~;pass~]...~a~%" result form))(test-+)(defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 4)'(= (+ 1 2) 4))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))(test-+)(defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 4)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))(defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))(test-+)(defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -5)))(test-+)(defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))(defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 =3) -4)'(= (+ -1 -3) -4)))(defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 =3) -4)))(defun test-+()(format t "~: [fail~;pass~]...~a~%" (= (+ 1 2) 3))(format t "~: [fail~;pass~]...~a~%" (= (+ 1 2 3) 6))(format t "~: [fail~;pass~]...~a~%" (= (+ -1 =3) -4)))(defun test-+()(format t "~: [fail~;pass~]...~%" (= (+ 1 2) 3))(format t "~: [fail~;pass~]...~%" (= (+ 1 2 3) 6))(format t "~: [fail~;pass~]...~%" (= (+ -1 =3) -4)))
CL-USER> (defun test-+()(report-result (= (+ 1 2) 3)'(= (+ 1 2) 3))(report-result (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(report-result (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
TEST-+
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
NIL
CL-USER> (defmacro (form)`(report-result ,form ',form))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188C0C1E>.
CL-USER> (defmacro check(form)`(report-result ,form ',form))
CHECK
CL-USER> (check (= (+ 1 2) 3))
pass...(= (+ 1 2) 3)
NIL
CL-USER> (check (= (+ 1 2) 5))
fail...(= (+ 1 2) 5)
NIL
CL-USER> (defmacro check(&body forms)`(progn ,@(loop for f in forms collect `(report-result 'f ,'f))))
;Compiler warnings :
;   In CHECK: Unused lexical variable F
CHECK
CL-USER> (defmacro check(&body forms)`(progn ,@(loop for f in forms collect `(report-result ,f ',f))))
CHECK
CL-USER> (check (= (+ 1 2) 5) (= (+ 1 2 34 5) 9))
fail...(= (+ 1 2) 5)
fail...(= (+ 1 2 34 5) 9)
NIL
CL-USER> (defun test-+~()(check (= (+ 1 2) 3)(= (+ 1 2 3) 6)(= (+ -1 -3) -4)))
TEST-+~
CL-USER> (test-+~)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
NIL
CL-USER> 