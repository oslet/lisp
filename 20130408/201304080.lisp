; SLIME 2011-02-04
CL-USER> (loop for i from 1 to 100 summing i)
5050
CL-USER> (loop for i from 1 to 100 summing (expt i 2))
338350
CL-USER> (loop for i across "every little bit helps" counting (find i "aeiou"))
6
CL-USER> (loop for i from 1 to 10 collecting i)
(1 2 3 4 5 6 7 8 9 10)
CL-USER> (do ((nums nil)(i 1 (1+ i)))((> i 10))(nreverse nums)(push nums i))
;Compiler warnings :
;   In an anonymous lambda form: Function result ignored in call to NREVERSE
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1878BA6E>.
CL-USER> (do ((nums nil)(i 1 (1+ i)))((> i 10))(nreverse nums)(push i nums))
;Compiler warnings :
;   In an anonymous lambda form: Function result ignored in call to NREVERSE
NIL
CL-USER> (do ((nums nil)(i 1 (1+ i)))((> i 10))(nreverse nums)(push i nums))
;Compiler warnings :
;   In an anonymous lambda form: Function result ignored in call to NREVERSE
NIL
CL-USER> (do ((nums nil)(i 1 (1+ i)))((> i 10))(nreverse nums)(push i nums))
;Compiler warnings :
;   In an anonymous lambda form: Function result ignored in call to NREVERSE
NIL
CL-USER> (do ((nums nil)(i 1 (1+ i)))((> i 10)(nreverse nums))(push i nums))
(1 2 3 4 5 6 7 8 9 10)
CL-USER> (loop for i below 10 and a = 0 then b and b = 1 then (+ b a) finally (return a))
55
CL-USER> (loop for i below 19 and a = 0 then b and b = 1 then (+ b a) finally (return a))
4181
CL-USER> (defun primep(number)(when (> number 1)(loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))
PRIMEP
CL-USER> (primep 11)
T
CL-USER> (primep 12)
NIL
CL-USER> (defun next-primep(number)(loop for n from when (primep n) return n))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187C40B6>.
CL-USER> (deffun next-primep(number)(loop for n from number when (priemp n) return n))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187DCF1E>.
CL-USER> (defun next-primep(number)(loop for n from number when (primep n) return n))
NEXT-PRIMEP
CL-USER> (next-primep 11)
11
CL-USER> (next-primep 12)
13
CL-USER> (next-primep 15)
17
CL-USER> (do ((p (next-primep 0)(next-primep (1+ p))))((> p 19))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do ((p (next-primep 0)(next-primep (1+ p))))((> p 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (next-primes 100)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187FED3E>.
CL-USER> (next-primep 100)
101
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
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
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 
NIL
CL-USER> (app (list 'a) b c)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1882DC26>.
CL-USER> (append (list 'a)(1 2)(list 'c))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188426A6>.
CL-USER> (append (list 'a)(list 1 2)(list 'c))
(A 1 2 C)
CL-USER> `(a (list 1 2) c)
(A (LIST 1 2) C)
CL-USER> `(a ,(+ 1 2) c)
(A 3 C)
CL-USER> `(a ,(list 1 2) c)
(A (1 2) C)
CL-USER> `(a ,@(list 1 2 c))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1885D25E>.
CL-USER> `(a ,@(list 1 2) c)
(A 1 2 C)
CL-USER> (defmacro do-primes ((var start end) &body body)(append '(do)(list (list (list var (list 'next-prime start)(list 'next-prime (list '1- var)))))(list (list (list '> var end))) body))
DO-PRIMES
CL-USER> (do-primes (p 0 20)(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function NEXT-PRIME
;   In an anonymous lambda form: Undefined function NEXT-PRIME
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1877381E>.
CL-USER> (defun next-prime (number)(loop for n from 2 to number when (primep n) return n))
NEXT-PRIME
CL-USER> (defmacro do-primes ((var start end) &body body)(append '(do)(list (list (list var (list 'next-prime start)(list 'next-prime (list '1- var)))))(list (list (list '> var end))) body))
DO-PRIMES
CL-USER> (do-primes (i 0 20)(format t "~d " i))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1879081E>.
CL-USER> (do-primes (i 0 19)(format t "~d " i))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187B4FBE>.
CL-USER> (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(i 1 (next-prime ,end))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d" p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function I
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187D5B6E>.
CL-USER> (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187F7CB6>.
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body)) (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x18819CDE>.
CL-USER> (defmacro do-primes ((var start end) &body body)(append '(do)(list (list (list var (list 'next-prime start)(list 'next-prime (list '1- var)))))(list (list (list '> var end))) body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1884043E>.
CL-USER> (defmacro do-primes a ((var start end) &body body)(append '(do)(list (list (list var (list 'next-prime start)(list 'next-prime (list '1- var)))))(list (list (list '> var end))) body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18854CFE>.
CL-USER> (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1886E91E>.
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x18791BDE>.
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 (random 100))(formoat t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function FORMOAT
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187A6CCE>.
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187C287E>.
CL-USER> (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 (random 100))(formoat t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function FORMOAT
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187D7996>.
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 (random 100))(formoat t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function FORMOAT
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187E8E5E>.
CL-USER> (do-primes (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (defun next-prime(number)(loop for n from 2 to number when (primep n) return n))
NEXT-PRIME
CL-USER> (defmacro do-primes ((var start end ) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x18806FBE>.
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (defmacro do-prime ((var start end) &body body)`(do ((,var (next-prime ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIME
CL-USER> (do-prime (p 0 21)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1883070E>.
CL-USER> (defmacro do-prime ((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIME
CL-USER> (do-prime (p 0 21)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1884DC36>.
CL-USER> (defmacro do-prime ((var start end) &body body)`(do ((,var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIME
CL-USER> (do-prime (p 0 21)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (macroexpand-1 `(do-prime (p 0 19)(format t "~d " p)))
(DO ((P (NEXT-PRIMEP 0) (NEXT-PRIMEP (1+ P)))) ((> P 19)) (FORMAT T "~d " P))
T
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 7 
NIL
CL-USER> (do-prime (p 0 (random 100))(format t "~d " p))
2 3 5 
NIL
CL-USER> (defun next-prime(number)(loop for n from 2 to number when (primep n) return n))
NEXT-PRIME
CL-USER> (next-prime 11)
2
CL-USER> (next-prime 12)
2
CL-USER> 
2
CL-USER> (defun next-prime (number)(loop for n from number when (primep n) return n))
NEXT-PRIME
CL-USER> (next-prime x)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1887B1FE>.
CL-USER> (next-prime 11)
11
CL-USER> (next-prime 15)
17
CL-USER> (next-prime 2)
2
CL-USER> (next-prime 100)
101
CL-USER> (next-prime 102)
103
CL-USER> (do-prime (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do-primes (p 0 19)(fomrat t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function FOMRAT
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187AB8AE>.
CL-USER> (defmacro do-primes ((var start end) &body body)`(do ((var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187DF20E>.
CL-USER> (defmacro do-primes ((var start end) &body body)`(do ((var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable P (3 references)
;   In an anonymous lambda form: Unused lexical variable VAR
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x18803A56>.
CL-USER> (defmacro do-primes ((var start end) &body body)`(do ((var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable P (3 references)
;   In an anonymous lambda form: Unused lexical variable VAR
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x188157A6>.
CL-USER> (do-primes (p 0 19)(format t "~d " p))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable P (3 references)
;   In an anonymous lambda form: Unused lexical variable VAR
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x18828BCE>.
CL-USER> (defmacro do-primes ((var start end) &body body)`(do ((,var (next-primep ,start)(next-primep (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (defmacro do-primes ((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (defmacro do-rimes ((var start end) &body body)`(do ((ending-value ,end)(,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ending-value)) ,@body))
DO-RIMES
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 
NIL
CL-USER> (defmacro do-primes ((var start end &body body))`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((ending-vaule ,end))((> ,var ending-value)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1885D46E>.
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1886EF06>.
CL-USER> (defmacro do-primes ((var start end &body body))`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(ending-vaule ,end))((> ,var ending-value)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1888D4DE>.
CL-USER> (defmacro do-primes ((var start end &body body))`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(ending-value ,end))((> ,var ending-value)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x188ACC76>.
CL-USER> (defmacro do-primes ((var start end &body body))`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(ending-value ,end))((> ,var ending-value)) ,@body))
  DO-PRIMES
  CL-USER> (do-primes (ending-value 0 10)(print ending-value))
  Invoking restart: Kill this thread
  ; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187D926E>.
  CL-USER> (macroexpand-1 do-primes (ending-value 0 10)(print ending-value))
  Invoking restart: Return to SLIME's top level.
  ; Evaluation aborted on #<UNBOUND-VARIABLE #x187F457E>.
  CL-USER> (macroexpand-1 `(do-primes (ending-value 0 10)(print ending-value)))
  Invoking restart: Kill this thread
  ; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1880B356>.
  CL-USER> (macroexpand-1 `(do-primes (ending-value 0 10)(print ending-value)))
  Invoking restart: Kill this thread
  ; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18821336>.
  CL-USER> (defmacro do-primes ((var start end) &body body)(let ((ending-value-name (gensym)))`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)) ,@body))) 
  DO-PRIMES
  CL-USER> (do-primes (p 0 19)(format t "~d " p))
  2 3 5 7 11 13 17 19 
  NIL
  CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
  2 3 5 7 11 13 17 19 23 29 31 37 41 
  NIL
  CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
  2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 
  NIL
  CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
  2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 
  NIL
  CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
  2 3 5 7 11 13 17 19 
  NIL
  CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
  2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 
  NIL
  CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
  2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
  NIL
  CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
  2 3 5 7 11 13 17 19 23 29 31 37 
  NIL
  CL-USER> (do-primes (ending-value 0 19)(format t "~d " p))
  ;Compiler warnings :
  ;   In an anonymous lambda form: Undeclared free variable P
  Invoking restart: Kill this thread
  ; Evaluation aborted on #<UNBOUND-VARIABLE #x18855226>.
  CL-USER> (do-primes (ending-value 0 19)(print ending-value))

  2 
  3 
  5 
  7 
  11 
  13 
  17 
  19 
  NIL
  CL-USER> (do-primes (ending-value 0 (random 100))(print ending-value))

  2 
  3 
  5 
  7 
  11 
  13 
  17 
  19 
  23 
  29 
  31 
  37 
  41 
  NIL
  CL-USER> (do-primes (ending-value 0 (random 100))(print ending-value))

  2 
  3 
  5 
  7 
  11 
  13 
  17 
  19 
  23 
  29 
  31 
  37 
  41 
  43 
  47 
  53 
  59 
  NIL
  CL-USER> (macroexpand-1 `(do-primes (ending-value 0 19)(print ending-value)))
  (DO ((ENDING-VALUE (NEXT-PRIME 0) (NEXT-PRIME (1+ ENDING-VALUE))) (#:G18 19)) ((> ENDING-VALUE #:G18)) (PRINT ENDING-VALUE))
  T
  CL-USER> (macroexpand-1 `(do-prmes))
  (DO-PRMES)
  NIL
  CL-USER> (macroexpand-1 '(do-primes))
  Invoking restart: Kill this thread
  ; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1887077E>.
  CL-USER> (macroexpand-1 `(do-primes))
  Invoking restart: Kill this thread
  ; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18883326>.
  CL-USER> (defmacro do-primes ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)) ,@body)))
  ;Compiler warnings :
  ;   In DO-PRIMES: Undefined function WITH-GENSYMS
  ;   In DO-PRIMES: Undefined function ENDING-VALUE-NAME
  ;   In DO-PRIMES: Undeclared free variable ENDING-VAULE-NAME
  ;   In DO-PRIMES: Undeclared free variable ENDING-VALUE-NAME
  DO-PRIMES
  CL-USER> (defmacro do-primes ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)) ,@body)))
  ;Compiler warnings :
  ;   In DO-PRIMES: Undefined function WITH-GENSYMS
  ;   In DO-PRIMES: Undefined function ENDING-VALUE-NAME
  ;   In DO-PRIMES: Undeclared free variable ENDING-VALUE-NAME (2 references)
  DO-PRIMES
  CL-USER> (defmacro with-gensyms ((&rest names) &body body)`(let ,(loop for n in names collect `(,n (gensyms))) ,@body))
  WITH-GENSYMS
  CL-USER> (defmacro do-primes ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)) ,@body)))
  ;Compiler warnings :
  ;   In DO-PRIMES: Undefined function GENSYMS
  DO-PRIMES
  CL-USER> (defmacro do-primes ((var start end) &body body)(with-gensyms (ending-value-name)`(do ((,var (next-prime ,start)(next-prime (1+ ,var)))(,ending-value-name ,end))((> ,var ,ending-value-name)) ,@body)))
  ;Compiler warnings :
  ;   In DO-PRIMES: Undefined function GENSYMS
  DO-PRIMES
  CL-USER> 