; SLIME 2011-02-04
CL-USER> (defun foo()(rotatef a b)(list a b))
;Compiler warnings :
;   In FOO: Undeclared free variable A (3 references)
;   In FOO: Undeclared free variable B (3 references)
FOO
CL-USER> (setf a 10 b 20)
20
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
CL-USER> (foo)
(20 10)
CL-USER> (foo)
(10 20)
CL-USER> (defun foo()(let ((tmp a))(setf a b b tmp) nil)(list a b))
FOO
CL-USER> (foo)
(20 10)
CL-USER> (foo)
(10 20)
CL-USER> (shift a b 10)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1878A09E>.
CL-USER> (shiftf a b 10)
10
CL-USER> (shiftf a b 10)
20
CL-USER> (shiftf a b 10)
10
CL-USER> (shiftf a b 10)
10
CL-USER> (shiftf a b 10)
10
CL-USER> (shiftf a b 10)
10
CL-USER> (shiftf a b 10)
10
CL-USER> (defun foo()(let ((tmp a))(setf a b b )tmp)(list a b))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187A48C6>.
CL-USER> (defun foo()(let ((tmp a))(setf a b b 10)tmp)(list a b))
FOO
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo(foo))
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (foo)
(10 10)
CL-USER> (if test ture false)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187B9FDE>.
CL-USER> (if (> 2 3) "yup" "nope")
"nope"
CL-USER> (if (< 2 3) "yup" "nope")
"yup"
CL-USER> (if (< 2 3) "yup")
"yup"
CL-USER> (if (> 2 3) "yup")
NIL
CL-USER> (if (> 2 3) "os" "el")
"el"
CL-USER> (if (spam-p current-message)(progn (file-in-spam-folder current-message)(update-spam-database current-message)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187DE1C6>.
CL-USER> (if (spam-p current-message)(progn (file-in-spam-folder current-message)(update-spam-database current-message)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187E99D6>.
CL-USER> (if (spam p current-message)(progn (file-in-spam-folder current-message)(update-spam-database current-message)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x188242BE>.
CL-USER> (if (spam-p current-message)(progn (file-in-spam-folder current-message)(update-spam-database current-message)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x18831EEE>.
CL-USER> 