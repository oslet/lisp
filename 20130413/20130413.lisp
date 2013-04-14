; SLIME 2011-02-04
CL-USER> (defun free()(list "memory" "money" "marry"))
FREE
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (free)
("memory" "money" "marry")
CL-USER> (defun primep(number)(when (> number 1)(loop for fac from number to (isqrt number) never (zerop (mod number fac)))))
PRIMEP
CL-USER> (primep 1)
NIL
CL-USER> (primep 2)
T
CL-USER> (primep 1234132432)
T
CL-USER> (defun next-prime(number)(loop for n from number when (primep n)return n))
NEXT-PRIME
CL-USER> (next-prime 13)
13
CL-USER> (next-prime 14)
14
CL-USER> (next-prime 15)
15
CL-USER> (defun next-prime(number)(loop for n from 2 when (primep n)return n))
;Compiler warnings :
;   In NEXT-PRIME: Unused lexical variable NUMBER
NEXT-PRIME
CL-USER>  (defun next-prime(number)(loop for n from number when (primep n)return n))
NEXT-PRIME
CL-USER> (defun primep(number)(when (> number 1)(loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))
PRIMEP
CL-USER> (primep 2)
T
CL-USER> (primep 15150)
NIL
CL-USER> (next-primep 12)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x18786286>.
CL-USER> (next-prime 12)
13
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (defun do-primes((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime(1+ ,var))))((> ,var ,end)) ,@body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187B3C0E>.
CL-USER> (defun do-primes((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime(1+ ,var))))((> ,var ,end)) ,@body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187CFE56>.
CL-USER> (defun do-primes ((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime(1+ ,var))))((> ,var ,end)) ,@body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1882C2FE>.
CL-USER> (defmacro do-primes ((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> 