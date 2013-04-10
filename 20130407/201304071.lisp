CL-USER> `(1 (+ 2 3) 3)
(1 (+ 2 3) 3)
CL-USER> `(a (+ bc ) c)
(A (+ BC) C)
CL-USER> `(a (+ b c) c)
(A (+ B C) C)
CL-USER> `(a (+ 1 2) c)
(A (+ 1 2) C)
CL-USER> `(a ,(+ 1 2) c)
(A 3 C)
CL-USER> `(a (list 1 2) c)
(A (LIST 1 2) C)
CL-USER> `(a ,(list 1 2) c)
(A (1 2) C)
CL-USER> `(a ,@(list 1 2) c)
(A 1 2 C)
CL-USER> (list 'a '(+ 1 2) 'c)
(A (+ 1 2) C)
CL-USER> (list 'a (+ 1 2) c)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187F482E>.
CL-USER> (list 'a (+ 1 2) 'c)
(A 3 C)
CL-USER> (list 'a '(list  1 2) 'c)
(A (LIST 1 2) C)
CL-USER> (list 'a ,(list 1 2) 'c)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x1880D7EE>.
CL-USER> (list 'a (list 1 2) 'c)
(A (1 2) C)
CL-USER> (append '(list a)(list 1 2)'(list c))
(LIST A 1 2 LIST C)
CL-USER> (append (list 'a (list 1 2) list 'c))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x18825476>.
CL-USER> (append (list 'a)(list 1 2)(list 'c))
(A 1 2 C)
CL-USER> (do-primes (p 0 19)(format t "~2d" p))
 2 3 5 711131719
NIL
CL-USER> (do-primes (p 0 19)(format t "~3d" p))
  2  3  5  7 11 13 17 19
NIL
CL-USER> (do-primes (p 0 19)(format t "~d" p))
235711131719
NIL
CL-USER> (macroexpand-1 do-primes)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1884B1BE>.
CL-USER> (macroexpand-1 do-primes(p 0 19)(format t "~3d" p))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1885BBAE>.
CL-USER> (macroexpand-1 `(do-primes(p 0 19)(format t "~3d" p)))
(DO ((P (NEXT-PRIME 0) (NEXT-PRIME (1+ P)))) ((> P 19)) (FORMAT T "~3d" P))
T
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 
NIL
CL-USER> (do-primes (p 0 (random 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 
NIL
CL-USER> (macroexpand-1 `(do-primes(p 0 (random 100))(format t "~d " p)))
(DO ((P (NEXT-PRIME 0) (NEXT-PRIME (1+ P)))) ((> P (RANDOM 100))) (FORMAT T "~d " P))
T
CL-USER> (defmacro do-primes(value start end)`(do ((edning-value ,end)(,var (next-prime ,start)(next-prime (1+ ,var))))((> ,value ending-value)) ,@body))
;Compiler warnings :
;   In DO-PRIMES: Undeclared free variable VAR (2 references)
;   In DO-PRIMES: Undeclared free variable BODY
DO-PRIMES
CL-USER> (defmacro do-primes(value start end)`(do ((ending-value ,end)(,varlue (next-prime ,start)(next-prime (1+ ,var))))((> ,value ending-value)) ,@body))
;Compiler warnings :
;   In DO-PRIMES: Undeclared free variable VARLUE
;   In DO-PRIMES: Undeclared free variable VAR
;   In DO-PRIMES: Undeclared free variable BODY
DO-PRIMES
CL-USER> (defmacro do-primes(value start end &body body)`(do ((ending-value ,end)(,value (next-prime ,start)(next-prime (1+ ,value))))((> ,value ending-value)),@body))
DO-PRIMES
CL-USER> (defmacro (do-primes ((value start end) &body body))`(do ((ending-value ,end)(,value (next-prime ,start)(next-prime (1+ ,value))))((> ,value ending-value)) ,@body))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187A6B76>.
CL-USER> (defmacro do-primes ((value start end) &body body)`(do ((ending-value ,end)(,value (next-prime ,start)(next-prime (1+ ,value))))((> ,value ending-value)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 20)(format t "~d " p))
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
CL-USER> 