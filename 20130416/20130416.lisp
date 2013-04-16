; SLIME 2011-02-04
CL-USER> (loop for i from 1 to 100 summing i)
5050
CL-USER> (loop for i from 1 to 100 summing (expt i 2))
338350
CL-USER> (loop for i across "every little bit helps a rolling stone gathers no moss" counting (find i "aeiou"))
15
CL-USER> (loop for i below 11 when i > 1 a = 0 then b b = 1 then (+ b a) (finally return a))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1878CFBE>.
CL-USER> (loop for i below 11 a = 0 then b b = 1 then (+ b a) finally (return a))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM -ERROR #x187A94BE>.
CL-USER> (loop for i below 11 and a = 0 then b and b = 1 then (+ b a) finally (return a))
89
CL-USER> (defun primep (number)(when (> number 1)(loop for i from 2 to (isqrt number) never (zerop (mod number i)))))
PRIMEP
CL-USER> (primep 11)
T
CL-USER> (primep 
NIL
CL-USER> (defun next-prime(number) (loop for i from number when (primep i)return i))
NEXT-PRIME
CL-USER> (next-primep 12)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187D3246>.
CL-USER> (next-prime 12)
13
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> (defmacro do-primes((var start end) &body body)`(do ((,var (next-prime ,start)(next-prime (1+ ,var))))((> ,var ,end)) ,@body))
DO-PRIMES
CL-USER> (do-primes (p 0 19)(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> 