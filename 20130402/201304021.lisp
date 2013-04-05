; SLIME 2011-02-04
CL-USER> (defmacro banktrace(expr)(reverse expr))
BANKTRACE
CL-USER> (banktrace "hello,world t format ")
" tamrof t dlrow,olleh"
CL-USER> (banktrace ("hello,world" t format))
hello,world
NIL
CL-USER> (defun banktrace(expr)(reverse expr))
; Warning: The macro BANKTRACE is being redefined as a function.
; While executing: CCL::%DEFUN, in process repl-thread(10).
BANKTRACE
CL-USER> (banktrace "hello,world t format")
"tamrof t dlrow,olleh"
CL-USER> (banktrace ("hello,world" t format))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18789C46>.
CL-USER> (demacro banktrace(expr)(reverse expr))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A24CE>.
CL-USER> (defmacro banktrace(expr)(reverse expr))
; Warning: The function BANKTRACE is being redefined as a macro.
; While executing: (SETF MACRO-FUNCTION), in process new-repl-thread(11).
BANKTRACE
CL-USER> (defvar *db* nil)
*DB*
CL-USER> (defun load-db(filename)(with-open-file (in filename)(with-standard-io-syntax setf *db* (read in))))
;Compiler warnings :
;   In LOAD-DB: Undeclared free variable SETF
LOAD-DB
CL-USER> (defun load-db(filename)(with-open-file(in filename)(with-standard-io-syntax (setf *db* (read in)))))
LOAD-DB
CL-USER> (load-db "/home/oslet/learning/lisp/20130324.lisp")
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-FILE-ERROR #x187DD92E>.
CL-USER> (load-db "/home/oslet/learning/lisp/20130324/20130324.lisp")
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-FILE-ERROR #x187F4276>.
CL-USER> (load-db "/home/oslet/learning/lisp/20130324/my-cds.db")
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> *db*
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (defun make-comparision-expr(field value)(list 'equal(list 'getf 'cd 'field)value))
;Compiler warnings :
;   In MAKE-COMPARISION-EXPR: Unused lexical variable FIELD
MAKE-COMPARISION-EXPR
CL-USER> (defun make-comparision-expr(field value)(list 'equal(list 'getf 'cd field) value))
MAKE-COMPARISION-EXPR
CL-USER> (make-comparision-expr ":rating 11")
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x1881015E>.
CL-USER> (make-comparision-expr "rating 11")
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x1882CBDE>.
CL-USER> (make-comparision-expr :rating 11)
(EQUAL (GETF CD :RATING) 11)
CL-USER> (defun make-comparision-expr(field value)`(equal(getf cd field,value)))
;Compiler warnings :
;   In MAKE-COMPARISION-EXPR: Unused lexical variable FIELD
MAKE-COMPARISION-EXPR
CL-USER> (defun make-comparision-expr(field value)`(equal(getf cd,field) value))
;Compiler warnings :
;   In MAKE-COMPARISION-EXPR: Unused lexical variable VALUE
MAKE-COMPARISION-EXPR
CL-USER> (defun make-comparision-expr(field value)`(equal(getf cd field),value))
;Compiler warnings :
;   In MAKE-COMPARISION-EXPR: Unused lexical variable FIELD
MAKE-COMPARISION-EXPR
CL-USER> (defun make-comparision-expr(field value)`(equal(getf cd,field),value))
MAKE-COMPARISION-EXPR
CL-USER> (make-comparision-expr :rating 11)
(EQUAL (GETF CD :RATING) 11)
CL-USER> (select #'(lambda(cd)(and (equal(getf cd :title "give us a break")(equal(getf cd :rating 11))))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18857576>.
CL-USER> (select #'(lambda(cd) and (equal(getf cd :title "give us a break")(equal(getf cd ripped) t))))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable AND
;   In an anonymous lambda form: Undeclared free variable RIPPED
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x188742D6>.
CL-USER> (select #'(lambda(cd)(and (equal(getf cd :title) "give us a break")(equal(getf cd :ripped) t))))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x1877541E>.
CL-USER> (defun select(selector-fn)(remove-if-not selector-fn *db*))
SELECT
CL-USER> (select #'(lambda(cd)(and (equal(getf cd :title) "give us a break")(equal(getf cd :ripped) t))))
NIL
CL-USER> (select #'(lambda(cd)
		     (and (equal(getf cd :title) "give us a break")
			  (equal(getf cd :ripped) t))))
NIL
CL-USER> (defun make-comparision-list(fields)(loop while fields collecting (make-comparision-expr)(pop fields)(pop fields)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x18797F1E>.
CL-USER> (defun make-comparision-list(fields)(loop while fields collecting (make-comparision-expr(pop fields)(pop fields))))
MAKE-COMPARISION-LIST
CL-USER> (defmacro(&rest clauses)#'(lambda(cd)(and,@(make-comparision-list clauses))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x187BB05E>.
CL-USER> (defmacro where(&rest clauses)#'(lambda(cd)(and,@(make-comparision-list clauses))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-READER-ERROR #x187D436E>.
CL-USER> (defmacro where(&rest clauses)`#'(lambda(cd)(and,@(make-comparision-list clauses))))
WHERE
CL-USER> (where :title "give us a break" :ripped t)
#<Anonymous Function #x188453E6>
CL-USER> (macroexpand-1 (where :title "give us a break" :ripped 11))
#<Anonymous Function #x188AC66E>
NIL
CL-USER> (macroexpand-1 `(where title "give us a break" :ripped 11))
#'(LAMBDA (CD) (AND (EQUAL (GETF CD TITLE) "give us a break") (EQUAL (GETF CD :RIPPED) 11)))
T
CL-USER> (macroesxpand-1 '(where :title "give us a break" :artist "Dixie Chicks" :rating 11 :ripped t))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187FADA6>.
CL-USER> (macroexpand-1 `(where :title "give us a break" :artist "Dixie Chicks" :rating 11 :ripped t))
#'(LAMBDA (CD) (AND (EQUAL (GETF CD :TITLE) "give us a break") (EQUAL (GETF CD :ARTIST) "Dixie Chicks") (EQUAL (GETF CD :RATING) 11) (EQUAL (GETF CD :RIPPED) T)))
T
CL-USER> (if (> 2 3) "yup" "nope")
"nope"
CL-USER> (if (> 3 2) "yup" "nope")

"yup"
CL-USER> (if (> 2 3) "yup")
NIL
CL-USER> (if (spam-p current-message)(file-in-spam-folder current message)(update-spam-database current-message))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1881660E>.
CL-USER> (if (spam-p current-message)(progn (file-in-spam-folder current message)(update-spam-database current-message)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1882F7A6>.
CL-USER> (if (spam-p current-message)(progn (file-in-spam-folder current message)(update-spam-database current-message)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x1885287E>.
CL-USER> (when (spam-p current-message)(file-in-spam-folder current-message)(update-spam-database current-message))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x188686F6>.
CL-USER> (defmacro when (condition &rest body)`(if ,condition (progn ,@body)))
Invoking restart: Kill this thread
; Evaluation aborted on #<SIMPLE-ERROR #x1878F35E>.
CL-USER> (if a (do-x)(if b (do-y)(do-z)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A6216>.
CL-USER> (cons (a (do-x))(b (do-y))(c (do-z)))
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187C1E06>.
CL-USER> (cons ( (do-x))(b (do-y))(t (do-z)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187D7066>.
CL-USER> (not x 1)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187F1D9E>.
CL-USER> (not 1)
NIL
CL-USER> (not 0)
NIL
CL-USER> (not t)
NIL
CL-USER> (not nil)
T
CL-USER> (and t)
T
CL-USER> (and nil)
NIL
CL-USER> (or t)
T
CL-USER> (or nil)
NIL
CL-USER> (and nil and t)
NIL
CL-USER> (and t and nil)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x18807F86>.
CL-USER> (or t and or nil)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable AND
;   In an anonymous lambda form: Undeclared free variable OR
T
CL-USER> (or t or nil)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable OR
T
CL-USER> (or t)
T
CL-USER> (not t)
NIL
CL-USER> (not (= 1 2))
T
CL-USER> (not (= 1 1))
NIL
CL-USER> (and (= 2 2)(= 3 3))
T
CL-USER> (and (= 2 3)(= 3 3))
NIL
CL-USER> (or (= 1 2)(= 3 3))
T
CL-USER> (dotimes (i 10)(format t "~d" i))
0123456789
NIL
CL-USER> (dotimes (i 100)(format t "~d" i))
0123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899
NIL
CL-USER> (defun print-list(list)(dolist (i list) (format t "item: ~a~%" i)))
PRINT-LIST
CL-USER> (print-list (list 1 2 3 4 5))
item: 1
item: 2
item: 3
item: 4
item: 5
NIL
CL-USER> (dolist `(1 2 3)(print x))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1882AD6E>.
CL-USER> (dolist `(x ( 1 2 3 4 5)(print x)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x188494C6>.
CL-USER> (dolist `(x (1 2 3 4 5))(print x))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1885F54E>.
CL-USER> (dolist (x '( 1 2 3 4 5))(print x))

1 
2 
3 
4 
5 
NIL
CL-USER> (dolist (x '(1 2 3 4 5 ))(print x))

1 
2 
3 
4 
5 
NIL
CL-USER> (dolist (i '(1 2 3 4 5 6))(print i)(if(#'evenp i)(return)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x18880B0E>.
CL-USER> (dolist (i '(1 2 3 4 5))(print i)(if (evenp i)(return)))

1 
2 
NIL
CL-USER> (dotimes (i 4)(print i))

0 
1 
2 
3 
NIL
CL-USER> (dotimes (i 4)(format t "~d~%" i))
0
1
2
3
NIL
CL-USER> (dotimes (x 20)(dotimes (y 20)(format t "~3d " (* (x+1)(y+1))))(format t "~a~%"))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function X+1
;   In an anonymous lambda form: Undefined function Y+1
;   In an anonymous lambda form: Missing argument in format string:
;   "~a~%"
;     ^
;   
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187ACA5E>.
CL-USER> (dotimes (x 20)(dotimes (y 20)(format t "~3d" (* (x+1)(y+1))))(format t "~%"))
;Compiler warnings :
;   In an anonymous lambda form: Undefined function X+1
;   In an anonymous lambda form: Undefined function Y+1
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<CCL::UNDEFINED-FUNCTION-CALL #x187CA026>.
CL-USER> (dotimes (x 20)(dotimes (y 20)(format t "~3d" (* (1 + x)(1 + y))))(format t "~%"))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x187E54E6>.
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d " (* (1 + x)(1 + y))))(format t "~%"))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1880394E>.
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
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~2d " (* (1+ x)(1+ y))))(format t "~%"))
 1  2  3  4  5  6  7  8  9 
 2  4  6  8 10 12 14 16 18 
 3  6  9 12 15 18 21 24 27 
 4  8 12 16 20 24 28 32 36 
 5 10 15 20 25 30 35 40 45 
 6 12 18 24 30 36 42 48 54 
 7 14 21 28 35 42 49 56 63 
 8 16 24 32 40 48 56 64 72 
 9 18 27 36 45 54 63 72 81 
NIL
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d" (list ((1+ x)(1+ y))(*(1+ x)(1+ y)))))(format t "~%"))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::COMPILE-TIME-PROGRAM-ERROR #x1883754E>.
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~3d" (equal((list ((1+ x)(1+ y))(*(1+ x)(1+ y))))))(format t "~%")))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1885650E>.
CL-USER> (dotimes (x 9)(dotimes (y 9)(format t "~5d " (* (1+ x)(1+ y))))(format t "~%"))
    1     2     3     4     5     6     7     8     9 
    2     4     6     8    10    12    14    16    18 
    3     6     9    12    15    18    21    24    27 
    4     8    12    16    20    24    28    32    36 
    5    10    15    20    25    30    35    40    45 
    6    12    18    24    30    36    42    48    54 
    7    14    21    28    35    42    49    56    63 
    8    16    24    32    40    48    56    64    72 
    9    18    27    36    45    54    63    72    81 
NIL
CL-USER> 