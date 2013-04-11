; SLIME 2011-02-04
CL-USER> (defun primep(number)(loop for fac from number to (isqrt number) never (zerop (mod number fac))))
PRIMEP
CL-USER> (primep 2)
T
CL-USER> (primep 1)
NIL
CL-USER> (primep 0)
Invoking restart: Kill this thread
; Evaluation aborted on #<DIVISION-BY-ZERO #x1878799E>.
CL-USER> (primep 0)
Invoking restart: Kill this thread
; Evaluation aborted on #<DIVISION-BY-ZERO #x1878D4CE>.
CL-USER> (defun next-prime(number)(loop for n from 2 to number when (primep n)return n))
NEXT-PRIME
CL-USER> (next-prime 10)
2
CL-USER> (defun next-prime(number)(loop for n from number when (primep n)return n))
NEXT-PRIME
CL-USER> (next-prime 2)
2
CL-USER> (next-prime 3)
3
CL-USER> (next-prime 4)
4
CL-USER> (next-prime 12)
12
CL-USER> (defun next-prime(number)(loop for n from number when (primep n)return n))
NEXT-PRIME
CL-USER> (next-prime 12)
12
CL-USER> (primep 11)
T
CL-USER> (primep 10)
T
CL-USER> (primep 2)
T
CL-USER> (prime 1)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187A921E>.
CL-USER> (defun primep(number)(when (> number 1)(loop for n from 2 to (isqrt number) never (zerop (mod number fac)))))
;Compiler warnings :
;   In PRIMEP: Undeclared free variable FAC
PRIMEP
CL-USER> (defun primep(number)(when (> number 1)(loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))
PRIMEP
CL-USER> (next-primep 2)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187C826E>.
CL-USER> (next-primep 12)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187DC6B6>.
CL-USER> (defun next-prime (number)(loop for n from number when (primep n)return n))
NEXT-PRIME
CL-USER> (next-prime 2)
2
CL-USER> (next-prime 12)
13
CL-USER> (do ((p (next-prime 0)(i 1 (1+ p))))((> p 19))(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function I2 
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187F653E>.
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 19))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (defmacro do-primes((var start end) &body body)((,var (next-prime (1+ ,var))))((> ,var ,end)) ,@body)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x188198CE>.
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-prime (1+ ,var))))((> ,var ,end)) ,@body))
;Compiler warnings :
;   In DO-PRIMES: Unused lexical variable START
DO-PRIMES
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 100)(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> `(list 1 (list 1 2) 3)
(LIST 1 (LIST 1 2) 3)
CL-USER> `((list 1 2) ,(+ 1 2) c))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x1883E6CE>.
CL-USER> `(list 1 2 ,(+ 1 2) c)
(LIST 1 2 3 C)
CL-USER> `(list 1 2 ,@(+ b c) d)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x188594F6>.
CL-USER> `(a @(+ b c) d)
(A @ (+ B C) D)
CL-USER> `(a ,@(+ b c) d)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1886B1BE>.
CL-USER> (append a (+ bc))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1887E3B6>.
CL-USER> `(a ,@(list 1 2) c)
(A 1 2 C)
CL-USER> (list 1 2)
(1 2)
CL-USER> 