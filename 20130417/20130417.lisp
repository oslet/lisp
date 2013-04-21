CL-USER> (defun fib-rec(n)(if (= 0 n ) 0(if (= 1 n) 1 (+ (fib-rec (- n 2))(fib-rec (- n 1))))))
FIB-REC
CL-USER> (fib-rec 100)
Invoking restart: Kill this thread
; Evaluation aborted on NIL.
CL-USER> (fib-rec 1)
1
CL-USER> (fib-rec 2)
1
CL-USER> (fib-rec 5)
5
CL-USER> (fib-rec 6)
8
CL-USER> (fib-rec 10)
55
CL-USER> (fib-rec 50)
Invoking restart: Kill this thread
; Evaluation aborted on NIL.
CL-USER> (fib-rec 49)
Invoking restart: Kill this thread
; Evaluation aborted on NIL.
CL-USER> (fib 50)
12586269025
CL-USER> (f 87)
Invoking restart: Kill this thread
; Evaluation aborted on NIL.
CL-USER> (defun primep(number)(when (> number 1)(loop for i from 2 to (isqrt number) never (zerop (mod number i)))))
PRIMEP
CL-USER> (primep 11)
T
CL-USER> (primep 12)
NIL
CL-USER> (defun next-prime(number)(loop for i from number when (primep n) return n))
;Compiler warnings :
;   In NEXT-PRIME: Undeclared free variable N (2 references)
NEXT-PRIME
CL-USER> (defun next-prime(number)(loop for n from number when (primep n) return n))
NEXT-PRIME
CL-USER> (next-prime 12)
13
CL-USER> (next-prime 15)
17
CL-USER> (defmacro check(forms)`(progn (loop for f in forms collect `,@(report-result 'f ',f))))
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x1883338E>.
CL-USER> (defmacro check (forms)`(progn ,@(loop for f in forms collect '(report-result 'f ',f))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x1884B29E>.
CL-USER> (defmacro check (forms)`(progn ,@(loop for f in forms collect `(report-result ,f ',f))))
CHECK
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
F
CL-USER> (defmacro with-gensyms((&rest names) &body body)`(let ,(loop for n in names collect `(,n (gensym))) ,@body))
WITH-GENSYMS
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
F
CL-USER> (defmacro combine-forms(&body forms)(with-gensyms ,result)`(let ((,result t)) `(loop for f in forms collect `(unless ,f (setf ,f (nil)))) ,@forms) ,result)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x1888E526>.
CL-USER> (defmacro combine-forms(&body forms)(with-gensyms (result)`(let ((,result t)) `@(loop for f in forms collect `(unless ,f (setf ,result nil))) ,result)))
;Compiler warnings :
;   In COMBINE-FORMS: Unused lexical variable FORMS
COMBINE-FORMS
CL-USER> (defmacro combine-results(&body forms)(with-gensyms(result)`(let ((,result t))`@(loop for f in forms collect `(unless ,f (setf ,result nil))) ,result)))
;Compiler warnings :
;   In COMBINE-RESULTS: Unused lexical variable FORMS
COMBINE-RESULTS
CL-USER> (defmacro check(&body forms)`(combine-results `,@(loop for f in forms collect `(report-result ,f ',f))))
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x188CC9DE>.
CL-USER> (defmacro check (&body forms)`(combine-results ,(loop for f in forms collect `(report-result ,f ',f))))
CHECK
CL-USER> (test-+)
pass...(= (+ 1 2) 3)
pass...(= (+ 1 2 3) 6)
pass...(= (+ -1 -3) -4)
F
CL-USER> (defun report-result(result form)(format t " ~:[fail~;pass~]...~a~%" result form))
REPORT-RESULT
CL-USER> (test-+)
 pass...(= (+ 1 2) 3)
 pass...(= (+ 1 2 3) 6)
 pass...(= (+ -1 -3) -4)
NIL
CL-USER> (check (= (+ 1 2) 3))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable FORMS
;   In an anonymous lambda form: Undeclared free variable RESULT
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x187F4CD6>.
CL-USER> (defmacro check(&body forms)`(combine-results ,(loop for f in forms collect `(report-result ,f ',f))))
CHECK
CL-USER> (check (= (+ 1 2 ) 3))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable FORMS
;   In an anonymous lambda form: Undeclared free variable RESULT
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x1880EC4E>.
CL-USER> (defmacro combine-results(&body forms)(with-gensyms (result)`(let ((,result t)) ,@(loop for f in forms collect `(unless ,f (setf ,result nil))) ,result)))
COMBINE-RESULTS
CL-USER> (check (= (+ 1 2) 3)
		)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x18832206>.
CL-USER> (test-+)
 pass...(= (+ 1 2) 3)
 pass...(= (+ 1 2 3) 6)
 pass...(= (+ -1 -3) -4)
NIL
CL-USER> (defmacro check(&body forms)`(combine-results ,@(loop for f in forms collect `(report-result ,f `,f))))
CHECK
CL-USER> (check (= (+ 1 2 ) 3))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable F
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x188537B6>.
CL-USER> (defmacro check(&body forms)`(combine-results ,@(loop for f in forms collect `(report-result ,f ',f))))
CHECK
CL-USER> (check (= (+ 1 2) 3))
 pass...(= (+ 1 2) 3)
NIL
CL-USER> (test-+)
 pass...(= (+ 1 2) 3)
 pass...(= (+ 1 2 3) 6)
 pass...(= (+ -1 -3) -4)
NIL
CL-USER> (fib)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x18868BD6>.
CL-USER> (fib 2)
1
CL-USER> (fib 3)
2
CL-USER> (fib 4)
3
CL-USER> (fib 5)
5
CL-USER> (fib 6)
8
CL-USER> (fib 7)
13
CL-USER> (fib 8)
21
CL-USER> (fib 999)
26863810024485359386146727202142923967616609318986952340123175997617981700247881689338369654483356564191827856161443356312976673642210350324634850410377680367334151172899169723197082763985615764450078474174626
CL-USER> (loop for n from 1 to 100 fib(n))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188816C6>.
CL-USER> (fib 1)(fib 2)(fib 3)(fib 4)(fib 5)
5
CL-USER> ((fib 1)(fib 2)(fib 3)(fib 4)(fib 5)(format t "~d " fib))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188966BE>.
CL-USER> (list (fib 1)(fib2)(fib 3)(fib 4)(fib 5))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x188B0F86>.
CL-USER> (list (fib 1))
(1)
CL-USER> (append (fib 1)(fib 2)(fib 3)(fib 4)(fib 5))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x188CB14E>.
CL-USER> (do ((n 1 100)(fib n))((> n 100))(format t "~d " n))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable N
;   In an anonymous lambda form: Unused lexical variable FIB
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x187F4836>.
CL-USER> (do ((n 1 100)(fib n)(fib n+))((> n 100))(format t "~d " n))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable N
;   In an anonymous lambda form: Undeclared free variable N+
;   In an anonymous lambda form: Unused lexical variable FIB (2 references)
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x1880CC06>.
CL-USER> 