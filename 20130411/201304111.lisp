; SLIME 2011-02-04
CL-USER> (defun primep(number) (when (> number 2) loop for fac from 2 to (isqrt number) never (zerop (mod number fac))))
;Compiler warnings :
;   In PRIMEP: Undeclared free variable LOOP
;   In PRIMEP: Undeclared free variable FOR
;   In PRIMEP: Undeclared free variable FROM
;   In PRIMEP: Undeclared free variable TO
;   In PRIMEP: Undeclared free variable NEVER
;   In PRIMEP: Undeclared free variable FAC (2 references)
PRIMEP
CL-USER> (defun primep(number) (when (> number 2)(loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))
PRIMEP
CL-USER> (defun next-prime(number)(loop for n from number when (primep n) return n))
NEXT-PRIME
CL-USER> (next-prime 12)
13
CL-USER> (do ((p (next-primep 0)(next-primep (1+ p))))((> p 100))(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function NEXT-PRIMEP
;   In an anonymous lambda form: Undefined function NEXT-PRIMEP
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x18793806>.
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 100))(format t "~d " p))
3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (defmacro do-primes((var start end))`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
;Compiler warnings :
;   In DO-PRIMES: Undeclared free variable BODY
DO-PRIMES
CL-USER> (defmacro do-primes((var start end &body body))`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 100)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187BCC66>.
CL-USER> (defmacro do-primes ((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 100)(format t "~d " p))
3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (defun primep(number) (when (> number 1)(loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))
PRIMEP
CL-USER> (do-primes (p 0 100)(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> 