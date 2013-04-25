; SLIME 2011-02-04
CL-USER> (defun make-cd(title artist rating ripped)(list :title title :artist artist :rating rating :ripped ripped))
MAKE-CD
CL-USER> (defvar *db* nil)
*DB*
CL-USER> (defun add-record(cd)(push cd *db*))
ADD-RECORD
CL-USER> (add-record "roses" "kathy" 7 t)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-MANY-ARGUMENTS #x1878988E>.
CL-USER> (add-record (make-cd "roses" "kathy" 7 t))
((:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (add-record (make-cd "fly" "Dixie Chicks" 8 t))
((:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 8 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (add-record (make-cd "home" "Dixie Chicks" 9 t))
((:TITLE "home" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 8 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (defun prompt-read(prompt)(format t "~a " prompt)(force-output *query-io*)(read-line *query-io*)) 
PROMPT-READ
CL-USER> (defun prompt-for-cd()(make-cd (prompt-read "title")(prompt-read "artist")(or(parse-integer (prompt-read "rating") :junk-allowed t) 0)(y-or-n-p "ripped  [y/n]:")))
PROMPT-FOR-CD
CL-USER> (defun add-cds()(add-record(prompt-for-cd)(if(not(y-or-n-p "Another? [y/n]:"))(return))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187A61CE>.
CL-USER> (defun add-cds()(make-cd (add-record(prompt-for-cd)(if(not(y-or-n-p "Another? [y/n]:"))(return)))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187C34AE>.
CL-USER> (prompt-for-cd)
title oslet
artist eletmc
rating 6

ripped  [y/n]: (y or n)  y

(:TITLE "oslet" :ARTIST "eletmc" :RATING 6 :RIPPED T)
CL-USER> (defun add-cds()(add-record(prompt-for-cd)(if(not(y-or-n-p "Another"? [y/n]:))(return))))
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x187E9456>.
CL-USER> (defun prompt-read(prompt)(format t "~a: " prompt)(force-output *query-io*)(read-line *query-io*))
PROMPT-READ
CL-USER> (prompt-for-cd)
title: time
artist: date
rating: 9

ripped  [y/n]: (y or n)  y

(:TITLE " time" :ARTIST "date" :RATING 9 :RIPPED T)
CL-USER> *db*
((:TITLE "home" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 8 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (defun add-cds()(loop (add-record(prompt-for-cd)(if(not(y-or-n-p "Another? [y/n]:"))(return)))))
;Compiler warnings :
;   In ADD-CDS: In the call to ADD-RECORD with arguments ((PROMPT-FOR-CD) (IF (NOT (Y-OR-N-P "Another? [y/n]:")) (RETURN))),
;     2 arguments were provided, but at most 1 is accepted
;     by the current global definition of ADD-RECORD
ADD-CDS
CL-USER> (defun add-cds()(loop (add-record(prompt-for-cd))(if(not(y-or-n-p "Another? [y/n]:"))(return))))
ADD-CDS
CL-USER> (add-cds)
title: o
artist: s
rating: 6

ripped  [y/n]: (y or n)  y

Another? [y/n]: (y or n)  y
title: s
artist: o
rating: 9

ripped  [y/n]: (y or n)  y

Another? [y/n]: (y or n)  n

NIL
CL-USER> *db*
((:TITLE "s" :ARTIST "o" :RATING 9 :RIPPED T) (:TITLE "o" :ARTIST "s" :RATING 6 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 8 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (remove-if-not 'evenp (1 2 3 4 5 6))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18804776>.
CL-USER> (remove-if-not #'evenp '(1 2 3 4 5 6))
(2 4 6)
CL-USER> (remove-if-not #'lambda (equal(getf :cd aritst kathy)) *db*)
Invoking restart: Kill this thread
; Evaluation aborted on #<UNDEFINED-FUNCTION #x18820F1E>.
CL-USER> (remove-if-not #'lambda(equal(getf cd artist kathy)) *db*)
Invoking restart: Kill this thread
; Evaluation aborted on #<UNDEFINED-FUNCTION #x18834D3E>.
CL-USER> (remove-if-not #'(lambda cd (equal(getf cd :artist "kathy")) *db*))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x18853BDE>.
CL-USER> (setq f
	       (let ((x 1))
		 (lambda y (* x y))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1887055E>.
CL-USER> (setq f 
	       (let ((x 1))
		 (lambda (y)(* x y))))
#<CCL:COMPILED-LEXICAL-CLOSURE #x188A65FE>
CL-USER> (f)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1877114E>.
CL-USER> (let ((x 2))(funcall f))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable F
;   In an anonymous lambda form: Unused lexical variable X
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x187845CE>.
CL-USER> (let ((x 2))(funcall f 2))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable F
;   In an anonymous lambda form: Unused lexical variable X
2
CL-USER> (funcall f 2)
2
CL-USER> (defun addn(n)#'(lambda(x)(+ x n)))
ADDN
CL-USER> (addn 5)
#<CCL:COMPILED-LEXICAL-CLOSURE (:INTERNAL ADDN) #x1883937E>
CL-USER> (funcall addn 5)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x18796126>.
CL-USER> (funcall addn)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187ADC5E>.
CL-USER> (funcall addn 0)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187B8E46>.
CL-USER> #b10101
21
CL-USER> #b1
1
CL-USER> #b0
0
CL-USER> #b10
2
CL-USER> #b201
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x187D71FE>.
CL-USER> #b1010101010101010101010
2796202
CL-USER> #b010101010101010101
87381
CL-USER> #b100000001
257
CL-USER> #b100110011001100101
157285
CL-USER> #b1010/1011
10/11
CL-USER> #o77
63
CL-USER> #o777
511
CL-USER> #xDATA
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x187E9076>.
CL-USER> #xDADA
56026
CL-USER> #xaeae
44718
CL-USER> #36rDALIESOJDSFNDSHFDOEIOSJDFDFSUDH
649745056149395431661662198529088519019787287493
CL-USER> 123e.0
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187FD0D6>.
CL-USER> 123e1.0
Invoking restart: Retry SLIME REPL evaluation request.
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1881C49E>.
CL-USER> 123e0
123.0
CL-USER> 123ec
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1882E04E>.
CL-USER> 1ec
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1883D8A6>.
CL-USER> 1eC
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1884E09E>.
CL-USER> #c(2    1)
#C(2 1)
CL-USER> (/ 4)
1/4
CL-USER> (/ 2 3)
2/3
CL-USER> *
2/3
CL-USER> *
2/3
CL-USER> -
-
CL-USER> +
-
CL-USER> *
-
CL-USER> /
(-)
CL-USER> 2
2
CL-USER> *
2
CL-USER> +
*
CL-USER> -
-
CL-USER> /
(-)
CL-USER> 2
2
CL-USER> /
(2)
CL-USER> (get-universal-time)
3575783325
CL-USER> (get-time)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x18868D7E>.
CL-USER> (get-data)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1878492E>.
CL-USER> (get-date)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x18794FBE>.
CL-USER> (date)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187B16C6>.
CL-USER> (time)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187BC19E>.
CL-USER> (show time)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187D7B66>.
CL-USER> (incf x)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187E347E>.
CL-USER> (decf x)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187FEF16>.
CL-USER> (incf x 10)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1881CC7E>.
CL-USER> (setf x 1)
1
CL-USER> (incf x 10)
11
CL-USER> (decf x)
10
CL-USER> (incf x)
11
CL-USER> (setf x (1+ x))
12
CL-USER> (setf x (1- x))
11
CL-USER> (setf x (- x 1))
10
CL-USER> (setf x (+ x 1))
11
CL-USER> (/= 1 1)
NIL
CL-USER> (/= 1 2)
T
CL-USER> (/= 1 2 3)
T
CL-USER> (/= 1 2 3 1)
NIL
CL-USER> (> 2 3)
NIL
CL-USER> (<  1 5)
T
CL-USER> (< 2 3 4)
T
CL-USER> (> 2 5 8)
NIL
CL-USER> (> 8 2 5)
NIL
CL-USER> (max 1 9 5 4 2 0)
9
CL-USER> (min 1 9 5 4 2 0)
0
CL-USER> (min 1 9 5 4 2 0 -1)
-1
CL-USER> (max (-1 -2 -3 )
	      )
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18834596>.
CL-USER> (min -1 -2 -3)
-3
CL-USER> (remove-if-not #'doop '( 1 2 3 4 5 6 7 8 9 10)
			)
Invoking restart: Kill this thread
; Evaluation aborted on #<UNDEFINED-FUNCTION #x1885275E>.
CL-USER> (remove-if-not #'oddp '(1 2 3 4 5 6 7 8 9 10))
(1 3 5 7 9)
CL-USER> (remove-if-not #'evenp '( 1 2 3 4 5 6 7 8 9 10))
(2 4 6 8 10)
CL-USER> (count-if #'evenp #((1 a))(2 b)(3 c)(4 d)(5 e) :key #'first)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1886E9AE>.
CL-USER> (count-if #'evenp #((1 a)(2 b)(3 c)(4 d)(5 e)) :key #'first)
2(count-if #'evenp #((1 a)(2 b)(3 c)(4 d)(5 e)) :key #'second)(count-if #'evenp #((1 a)(2 b)(3 c)(4 d)(5 e)) :key #'first)(count-if #'evenp #((1 a))(2 b)(3 c)(4 d)(5 e) :key #'first)(remove-if-not #'evenp '( 1 2 3 4 5 6 7 8 9 10))(remove-if-not #'oddp '(1 2 3 4 5 6 7 8 9 10))(remove-if-not #'doop '( 1 2 3 4 5 6 7 8 9 10)
			)(min -1 -2 -3)(max (-1 -2 -3 )
	      )(min 1 9 5 4 2 0 -1)(min 1 9 5 4 2 0)(max 1 9 5 4 2 0)(> 8 2 5)(> 2 5 8)(< 2 3 4)
CL-USER> (count-if #'evenp #((1 a)(2 b)(3 c)(4 d)(5 e)) :key #'second)
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x1879D8D6>.
CL-USER> (count-if #'evenp #((1 a)(2 b)(3 c)(4 d)(5 e)) :key #'first)
2
CL-USER> (remove-duplicates (1 2 3 1 2 3 1 2 3 4))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187BA076>.
CL-USER> (remove-duplicates #'(1 2 3 1 2 3 1 2 3 4))
Invoking restart: Kill this thread
; Evaluation aborted on #<TYPE-ERROR #x187D4ABE>.
CL-USER> (remove-duplicates #(1 2 3 1 2 3 1 2 3 4))
#(1 2 3 4)
CL-USER> (dotimes (x 10)(dotimes (y 10)(format t "~3d " (* (1+ x)(1+ y)))(format t "~%")))
  1 
  2 
  3 
  4 
  5 
  6 
  7 
  8 
  9 
 10 
  2 
  4 
  6 
  8 
 10 
 12 
 14 
 16 
 18 
 20 
  3 
  6 
  9 
 12 
 15 
 18 
 21 
 24 
 27 
 30 
  4 
  8 
 12 
 16 
 20 
 24 
 28 
 32 
 36 
 40 
  5 
 10 
 15 
 20 
 25 
 30 
 35 
 40 
 45 
 50 
  6 
 12 
 18 
 24 
 30 
 36 
 42 
 48 
 54 
 60 
  7 
 14 
 21 
 28 
 35 
 42 
 49 
 56 
 63 
 70 
  8 
 16 
 24 
 32 
 40 
 48 
 56 
 64 
 72 
 80 
  9 
 18 
 27 
 36 
 45 
 54 
 63 
 72 
 81 
 90 
 10 
 20 
 30 
 40 
 50 
 60 
 70 
 80 
 90 
100 
NIL
CL-USER> (dotimes (x 10)(dotimes (y 10)(format t "~3d " (* (1+ x)(1+ y)))
				 ))
  1   2   3   4   5   6   7   8   9  10   2   4   6   8  10  12  14  16  18  20   3   6   9  12  15  18  21  24  27  30   4   8  12  16  20  24  28  32  36  40   5  10  15  20  25  30  35  40  45  50   6  12  18  24  30  36  42  48  54  60   7  14  21  28  35  42  49  56  63  70   8  16  24  32  40  48  56  64  72  80   9  18  27  36  45  54  63  72  81  90  10  20  30  40  50  60  70  80  90 100 
NIL
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d ~%" (* (1+ x)(1+ y)))))
  1 
  2 
  3 
  4 
  5 
  6 
  7 
  8 
  9 
  2 
  4 
  6 
  8 
 10 
 12 
 14 
 16 
 18 
  3 
  6 
  9 
 12 
 15 
 18 
 21 
 24 
 27 
  4 
  8 
 12 
 16 
 20 
 24 
 28 
 32 
 36 
  5 
 10 
 15 
 20 
 25 
 30 
 35 
 40 
 45 
  6 
 12 
 18 
 24 
 30 
 36 
 42 
 48 
 54 
  7 
 14 
 21 
 28 
 35 
 42 
 49 
 56 
 63 
  8 
 16 
 24 
 32 
 40 
 48 
 56 
 64 
 72 
  9 
 18 
 27 
 36 
 45 
 54 
 63 
 72 
 81 
NIL
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d " (* (x+ 1)(y+ 1)))))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function X+
;   In an anonymous lambda form: Undefined function Y+
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x18800E0E>.
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d " (* (1+ x)(1+ y))))(format t "~d"))
;Compiler warnings :
;   In an anonymous lambda form: Missing argument in format string:
;   "~d"
;     ^
;     1   2   3   4   5   6   7   8   9 
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x1881883E>.
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d " (* (1+ x)(1+ y))))(format t "~%"))
  1   2   3   4   5   6   7   8   9 
  2   4   6   8  10  12  14  16  18 
  3   6   9  12  15  18  21  24  27 
  4   8  12  16  20  24  28  32  36 
  5  10  15  20  25  30  35  40  45 
  6  12  18  24  30  36  42  48  54 
  7  14  21  28  35  42  49  56  63 
  8  16  24  32  40  48  56  64  72 
  9  18  27  36  45  54  63  72  81 
NIL
CL-USER> (loop for i from 1 to 100 summing i)
5050
CL-USER> (loop for i from 1 to 100 summing (expt i 2))
338350
CL-USER> (loop for i across "every little bit helps" counting (find i "aeiou"))
6
CL-USER> (loop for i from 1 to 100 counting i)
100
CL-USER> (loop for i from 1 to 100 counting i)
100
CL-USER> (loop for i below 10 and a = 0 then b and b = 1 then (+ b a) finally (return a))
55
CL-USER> (loop for i below 100 and a = 0 then b and b = 1 then (+ b a) finally (return a))
354224848179261915075
CL-USER> (loop for i below 2 and a = 0 then b and b = 1 then (+ b a) finally (return a))
1
CL-USER> (loop for i below 3 and a = 0 then b and b = 1 then (+ b a) finally (return a))
2
CL-USER> (loop for i below 4 and a = 0 then b and b = 1 then (+ b a) finally (return a))
3
CL-USER> (defun primep(number)(when (> number 1)(loop for i from 2 to (isqrt number) never (zerop (mod number i)))))
PRIMEP
CL-USER> (primep 1)
NIL
CL-USER> (primep 2)
T
CL-USER> (defun next-prime(number)(loop for i from number when (primep i)return i))
NEXT-PRIME
CL-USER> (next-prime 2)
2
CL-USER> (next-prime 12)
13
CL-USER> (do ((p (next-prime 0)(next-prime 1+ p)))((> p 19))(format t "~d" p))
;Compiler warnings :
;   In an anonymous lambda form: In the call to NEXT-PRIME with arguments (1+ P),
;     2 arguments were provided, but at most 1 is accepted
;     by the current global definition of NEXT-PRIME
;   In an anonymous lambda form: Undeclared free variable 1+2
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x1884B186>.
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 19))(format t "~d" p))
235711131719
NIL
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 19))(format t "~d " p))
2 3 5 7 11 13 17 19 
NIL
CL-USER> (do ((p (next-prime 0)(next-prime (1+ p))))((> p 100))(format t "~d " p))
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 
NIL
CL-USER> 