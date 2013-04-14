; SLIME 2011-02-04
CL-USER> (= (+ 1 2) 3)
T
CL-USER> (defun test-+()(= (+ 1 2) 3)(= (+ 1 2 3) 6)(= (+ -1 -3) -4))
TEST-+
CL-USER> (test-+)
T
CL-USER> (defun test-+()(and (format t "~:[fail;pass]...~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail;pass]...~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail;pass]...~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4))))
;Compiler warnings :
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~%"
;                     ^
;   
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~%"
;                     ^
;   
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~%"
;                     ^
;   
TEST-+
CL-USER> (defun test-+()(and (format t "~:[fail;pass]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail;pass]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail;pass]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4))))
;Compiler warnings :
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~a~%"
;                       ^
;   
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~a~%"
;                       ^
;   
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~a~%"
;                       ^
;   
TEST-+
CL-USER> (defun test-+()(format t "~:[fail;pass]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail;pass]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail;pass]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
;Compiler warnings :
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~a~%"
;                       ^
;   
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~a~%"
;                       ^
;   
;   In TEST-+: Expecting one of (#\; #\]) in format string:
;   "~:[fail;pass]...~a~%"
;                       ^
;   
TEST-+
CL-USER> (defun test-+()(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2) 3)'(= (+ 1 2) 3))(format t "~:[fail~;pass~]...~a~%" (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(format t "~:[fail~;pass~]...~a~%" (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
TEST-+
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
NIL
CL-USER> (defun report-form(result form)(format t "~:[fail~;pass~]...~a~%" result form))
REPORT-FORM
CL-USER> (defun test-+()(report-form (= (+ 1 2) 3))(report-form (= (+ 1 2 3) 6))(report-form (= (+ -1 -3) -4)))
;Compiler warnings :
;   In TEST-+: In the call to REPORT-FORM with arguments (T),
;     1 argument was provided, but at least 2 are required
;     by the current global definition of REPORT-FORM
;   In TEST-+: In the call to REPORT-FORM with arguments (T),
;     1 argument was provided, but at least 2 are required
;     by the current global definition of REPORT-FORM
;   In TEST-+: In the call to REPORT-FORM with arguments (T),
;     1 argument was provided, but at least 2 are required
;     by the current global definition of REPORT-FORM
TEST-+
CL-USER> (defun test-+()(report-form (= (+ 1 2) 3)'(= (+ 1 2) 3))(report-form (= (+ 1 2 3) 6)'(= (+ 1 2 3) 6))(report-form (= (+ -1 -3) -4)'(= (+ -1 -3) -4)))
TEST-+
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
NIL
CL-USER> (defmacro check(form)`(report-form ,form ',form))
CHECK
CL-USER> (check (= (+ 1 2 ) 3)')
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x187CE556>.
CL-USER> (check (= (+ 1 2) 3))
pass...(= (+ 1 2) 3)
NIL
CL-USER> 