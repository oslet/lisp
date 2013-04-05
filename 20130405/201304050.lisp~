; SLIME 2011-02-04
CL-USER> (set x 1 y 2 z 3)(list x y z))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A4A4E>.
CL-USER> ((setf 1 y 2 z 3)(list x y z))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18788B86>.
CL-USER> ((setf x 1 y 2 z 3)(list x y z))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187A5EFE>.
CL-USER> (setf x 1 y 2 z 3)
3
CL-USER> (setf x 1 y 2 z 3)(list 'x 'y 'z)
(X Y Z)
CL-USER> (defparameter *db* ())
*DB*
CL-USER> (adjoin 1 *db*)
(1)
CL-USER> (adjoin `(x y z)(setf x 1 y 2 z 3))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187C27EE>.
CL-USER> (adjoin *db* (setf x 1 y 2 z 3)(list 'x 'y 'z))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187D7D26>.
CL-USER> (adjoin *db* (setf x 1 y 2 z 3)(list 'x 'y 'z))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187EDC96>.
CL-USER> (adjoin 2 *db*)
(2)
CL-USER> (setf *db* (adjoin 1 *db*))
(1)
CL-USER> (setf *db* (adjoin (setf x 1 y 2 z 3) *db*))
(3 1)
CL-USER> (setf *db* (adjoin (list 'x 'y 'z) *db*))
((X Y Z) 3 1)
CL-USER> *db*
((X Y Z) 3 1)
CL-USER> (loop for i from 1 to 100 summing i)
5050
CL-USER> (loop for i form 1 to 100 summing (expt i 2))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1882B73E>.
CL-USER> (loop for i from 1 to 100 summing (expt i 2))
338350
CL-USER> (loop for i from 1 to 100 summing (expt i 3))
25502500
CL-USER> (loop for i below 10 and a = 0 then b and b = 1 then (+ a b) finaly (return a))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188508C6>.
CL-USER> (loop for i below 10 and a = 0 then b and b = 1 then (+ a b) finally (return a))
55
CL-USER> (loop for i below 2 and a = 0 then b  and b = 1 then (+ a b) finally (return a))
1
CL-USER> (loop for i below 3 and a = 0 then b and b =1 then (+ a b) finally (return a))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1887452E>.
CL-USER> (loop for i below 3 and a = 0 then b and b = 1 then (+ a b) finally (return a))
2
CL-USER> (defun free()(list 'memeory 'money 'marry))
FREE
CL-USER> (free)
(MEMEORY MONEY MARRY)
CL-USER> 