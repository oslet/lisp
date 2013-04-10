; SLIME 2011-02-04
CL-USER> (loop for i from 1 to 100 collecting i)
(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100)
CL-USER> (loop for 1 from 1 to 100 summing i)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187A133E>.
CL-USER> (loop for i from 1 to 100 summing i)
5050
CL-USER> (loop for i from 1 to 100 summing (expt i 2))
338350
CL-USER> (loop for i across "better late than never" counting (find i "aeiou"))
7
CL-USER> (do ((nums nil)(i 1 (1+ i)))((> i 10)(nreverse nums))(push nums i))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1879E4BE>.
CL-USER> (do ((nums nil)(i 1 (1+ i)))((> i 10)(nreverse nums))(push i nums))
(1 2 3 4 5 6 7 8 9 10)
CL-USER> (loop for i below 10 and a = 0 then b and b = 1 then (+ b a) finally (return a))
55
CL-USER> (loop for i below 11 and a = 0 then b and b = 1 then (+ b a) finally (return a))
89
CL-USER> (loop for i below 12 and a = 0 then b and b = 1 then (+ b a) finally (return a))
144
CL-USER> (+ 55 89)
144
CL-USER> (defun primep (number)(loop for fac from 2 to (isqrt number) never (zerop (mod number fac))))
PRIMEP
CL-USER> (defun next-primep (number)(loop for n from 2 to when (primep n)return n))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187C9BA6>.
CL-USER> (defun next-primep (number)(loop for n from 2 to number when (primep n)return n))
NEXT-PRIMEP
CL-USER> (net-primep 12)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187EA2BE>.
CL-USER> (next-primep 12)
2
CL-USER> (primep 2)
T
CL-USER> (primep 1234)
NIL
CL-USER> (defun next-primep (number)(loop for n from number when (primep n)return n))
NEXT-PRIMEP
CL-USER> (next-primep 11)
11
CL-USER> (next-primep 12)
13
CL-USER> (next-primep 15)
17
CL-USER> (do ((p (next-primep 0)(i 1 (1+ p))))((> p 19))(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function I0 
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187FFF5E>.
CL-USER> (do ((p (next-primep 0)(next-primep (1+ p))))((> p 19))(format t "~d" p))
01235711131719
NIL
CL-USER> (do ((p (next-primep 0)(next-prime (1+ p))))((> p 19))(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function NEXT-PRIME0 
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x188162EE>.
CL-USER> (do ((p (next-primep 0)(next-primep (1+ p))))((> p 19))(format t "~d " p))
0 1 2 3 5 7 11 13 17 19 
NIL
CL-USER> (primep 0
		 )
T
CL-USER> (do ((p (next-primep 0)(next-primep (1+ p))))((> p 19))(format t "~d " p))
0 1 2 3 5 7 11 13 17 19 
NIL
CL-USER> (do ((p (next-primep 0)(next-primep (1+ p))))((> p 100))(format t "~d " p))
0 1 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> 