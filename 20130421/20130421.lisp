; SLIME 2011-02-04
CL-USER> (defmacro free()(defun free()(list 'life 'world 'values)))
FREE
CL-USER> (free)
; Warning: The macro FREE is being redefined as a function.
; While executing: CCL::%DEFUN, in process repl-thread(10).
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A3686>.
CL-USER> (defmacro free()(defun free1()(list 'life 'world 'values)))
; Warning: The function FREE is being redefined as a macro.
; While executing: (SETF MACRO-FUNCTION), in process repl-thread(10).
FREE
CL-USER> (free)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1878AF9E>.
CL-USER> (defmacro free()`(defun free1()(list 'life 'world 'values)))
FREE
CL-USER> (free)
FREE1
CL-USER> (free1)
(LIFE WORLD VALUES)
CL-USER> (defmacro defun()'(defun defun()(defun 'defun 'defun 'defun)))
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x187F55AE>.
CL-USER> (defmacro defun()`(defun defun()(defun 'defun 'defun 'defun)))
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x188136B6>.
CL-USER> (defmacro (defun(free)`(defun 'defun 'defun 'defun 'defun)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1882EE06>.
CL-USER> (defmacro free()(defun x()(list 'life 'world 'values)))
FREE
CL-USER> (free)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1884D29E>.
CL-USER> (x)
(LIFE WORLD VALUES)
CL-USER> (free)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x18860B86>.
CL-USER> (defmacro free()(defun *()(list 'life 'world 'values)))
FREE
CL-USER> (free)
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x1887284E>.
CL-USER> (defmacro free()`(defun *()(list 'life 'world 'values)))
FREE
CL-USER> (free)
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x1876EFA6>.
CL-USER> (*)
1
CL-USER> *
1
CL-USER> *
1
CL-USER> (defmacro free()`(defun multiple()(list 'life 'world 'values))
		   )
FREE
CL-USER> (free)
MULTIPLE
CL-USER> (multiple)
(LIFE WORLD VALUES)
CL-USER> (defmacro free()`(defun multiple()(list 'life 'value 'world)))
FREE
CL-USER> (free)
MULTIPLE
CL-USER> (multiple)
(LIFE VALUE WORLD)
CL-USER> (defmacro free()`(defun multiple()(list 'life 'values 'world)))
FREE
CL-USER> (defmacro free()`(defun multiple()(list 'life 'values 'world')))(free)(multiple)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x187B690E>.
CL-USER> 