; SLIME 2013-02-02
CL-USER> (list 1 2 3 4)
(1 2 3 4)
CL-USER> (defmacro bankwards(expr)(reverse epxr))
; in: LAMBDA NIL
;     (LET* ((EXPR (CAR (CDR #:WHOLE1008))))
;       (BLOCK BANKWARDS (REVERSE EPXR)))
; 
; caught STYLE-WARNING:
;   The variable EXPR is defined but never used.

; in: LAMBDA NIL
;     (REVERSE EPXR)
; 
; caught WARNING:
;   undefined variable: EPXR
; 
; compilation unit finished
;   Undefined variable:
;     EPXR
;   caught 1 WARNING condition
;   caught 1 STYLE-WARNING condition
BANKWARDS
CL-USER> (defmacro bankwards(epxr)(reverse expr))
; in: LAMBDA NIL
;     (LET* ((EPXR (CAR (CDR #:WHOLE1012))))
;       (BLOCK BANKWARDS (REVERSE EXPR)))
; 
; caught STYLE-WARNING:
;   The variable EPXR is defined but never used.

;     (REVERSE EXPR)
; 
; caught WARNING:
;   undefined variable: EXPR
; 
; compilation unit finished
;   Undefined variable:
;     EXPR
;   caught 1 WARNING condition
;   caught 1 STYLE-WARNING condition
BANKWARDS
CL-USER> (defmacro bankwards(expr)(reverse expr))
BANKWARDS
CL-USER> (bankwards ("hello,world" t format))
hello,world
NIL
CL-USER> (defun make-compraison-list(field value)(list 'equal(list 'getf 'cd field) value))
MAKE-COMPRAISON-LIST
CL-USER> (make-comparison-list :rating 11 :title "give us a break")

;     (MAKE-COMPARISON-LIST :RATING 11 :TITLE "give us a break")
; 
; caught STYLE-WARNING:
;   undefined function: MAKE-COMPARISON-LIST
; 
; compilation unit finished
;   Undefined function:
;     MAKE-COMPARISON-LIST
;   caught 1 STYLE-WARNING condition

; No value
CL-USER> (make-comparison-list :rating 11)

; No value
CL-USER> (make-comparison-list :rating 11)

; No value
CL-USER> (make-compraison-list :rating 11)
(EQUAL (GETF CD :RATING) 11)
CL-USER> (defun make-compraison-expr(field value)`(equal(getf cd,field) value))
; in: LAMBDA NIL
;     (SB-INT:NAMED-LAMBDA MAKE-COMPRAISON-EXPR
;         (FIELD VALUE)
;       (BLOCK MAKE-COMPRAISON-EXPR `(EQUAL (GETF CD ,FIELD) VALUE)))
; ==>
;   #'(SB-INT:NAMED-LAMBDA MAKE-COMPRAISON-EXPR
;         (FIELD VALUE)
;       (BLOCK MAKE-COMPRAISON-EXPR `(EQUAL (GETF CD ,FIELD) VALUE)))
; 
; caught STYLE-WARNING:
;   The variable VALUE is defined but never used.
; 
; compilation unit finished
;   caught 1 STYLE-WARNING condition
MAKE-COMPRAISON-EXPR
CL-USER> (defun make-compraison-expr(field value)`(equal(getf cd,field),value))
STYLE-WARNING: redefining MAKE-COMPRAISON-EXPR in DEFUN
MAKE-COMPRAISON-EXPR
CL-USER> 
; No value
CL-USER> (make-compraison-expr :rating 11)
(EQUAL (GETF CD :RATING) 11)
CL-USER> (defun make-compraison-list(fields)(loop when fields collecting(make-compraison-expr(pop fields)(pop fields))))
STYLE-WARNING: redefining MAKE-COMPRAISON-LIST in DEFUN
MAKE-COMPRAISON-LIST
CL-USER> (make-compraison-list :rating 11 :title "give us a break")

; No value
CL-USER> (defun make-compraison-list(fields)(loop while fields collecting(make-compraison-expr(pop fields)(pop fields))))
STYLE-WARNING: redefining MAKE-COMPRAISON-LIST in DEFUN
MAKE-COMPRAISON-LIST
CL-USER> (defmacro where(&rest clauses)#'(lambda(cd)(and,@(make-compraison-list clauses))))

; No value
CL-USER> (defmacro where(&rest clauses)`#'(lambda(cd)(and,@(make-compraison-list clauses))))
WHERE
CL-USER> (defun make-cd(title artist rating ripped)(list :title title :artist artist :rating rating :ripped ripped))
MAKE-CD
CL-USER> (defvar *db* nil)
*DB*
CL-USER> (defun add-record(cd)(push cd *db*))
ADD-RECORD
CL-USER> (add-record (make-cd "oslet" "eletmc" 7 t))
((:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (add-record (make-cd "roses" "kathy" 8 t))
((:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T)
 (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (add-record (make-cd "fly" "Dixie Chicks" 9 t))
((:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T)
 (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T)
 (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (add-record (make-cd "home" "Dixie Chicks" 10 t))
((:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T)
 (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T)
 (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T)
 (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (defun prompt-read(prompt)(format t "~a " prompt)(force-ouput *query-io*)(read-line *query-io*))

;     (FORCE-OUPUT *QUERY-IO*)
; 
; caught STYLE-WARNING:
;   undefined function: FORCE-OUPUT
; 
; compilation unit finished
;   Undefined function:
;     FORCE-OUPUT
;   caught 1 STYLE-WARNING condition
PROMPT-READ
CL-USER> (defun prompt-read(prompt)(format t "~a " prompt)(force-output *query-io*)(read-line *query-io*))
STYLE-WARNING: redefining PROMPT-READ in DEFUN
PROMPT-READ
CL-USER> (defun prompt-for-cd()(make-cd(prompt-read "title")(prompt-read "artist")(or(parse-integer (prompt-read "rating") :junk-allowed t) 0)(y-or-n-p "ripped [y/n]:")))
PROMPT-FOR-CD
CL-USER> (defun add-cds()(loop (add-record(prompt-for-cd)(if(not(y-or-n-p "Another? [y/n]:"))(return)))))
; in: LAMBDA NIL
;     (ADD-RECORD (PROMPT-FOR-CD)
;                 (IF (NOT (Y-OR-N-P "Another? [y/n]:"))
;                     (RETURN)))
; 
; caught STYLE-WARNING:
;   The function was called with two arguments, but wants exactly one.
; 
; compilation unit finished
;   caught 1 STYLE-WARNING condition
ADD-CDS
CL-USER> (defun add-cds()(loop (add-record(prompt-for-cd))(if(not(y-or-n-p "Another? [y/n]:"))(return))))
STYLE-WARNING: redefining ADD-CDS in DEFUN
ADD-CDS
CL-USER> (add-cds)
title os
artist el
rating 7

ripped [y/n]: (y or n) y

Another? [y/n]: (y or n) y
title el
artist os
rating 8

ripped [y/n]: (y or n) y

Another? [y/n]: (y or n) n

NIL
CL-USER> *db*
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T)
 (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T)
 (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T)
 (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T)
 (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T)
 (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (defun save-db(filename)(with-open-file (in filename)(with-standard-io-syntax (setf *db* (read in)))))
SAVE-DB
CL-USER> (save-db "/home/oslet/learning/lisp/my-cds.db")

; No value
CL-USER> (defun save-db(fielname)(with-open-file (out filename :direction :output :if-exists :supersede)(with-standard-io-syntax (print *db* out))))
; in: LAMBDA NIL
;     (SB-INT:NAMED-LAMBDA SAVE-DB
;         (FIELNAME)
;       (BLOCK SAVE-DB
;         (WITH-OPEN-FILE (OUT FILENAME :DIRECTION :OUTPUT :IF-EXISTS :SUPERSEDE)
;           (WITH-STANDARD-IO-SYNTAX (PRINT *DB* OUT)))))
; ==>
;   #'(SB-INT:NAMED-LAMBDA SAVE-DB
;         (FIELNAME)
;       (BLOCK SAVE-DB
;         (WITH-OPEN-FILE (OUT FILENAME :DIRECTION :OUTPUT :IF-EXISTS :SUPERSEDE)
;           (WITH-STANDARD-IO-SYNTAX (PRINT *DB* OUT)))))
; 
; caught STYLE-WARNING:
;   The variable FIELNAME is defined but never used.

;     (WITH-OPEN-FILE (OUT FILENAME :DIRECTION :OUTPUT :IF-EXISTS :SUPERSEDE)
;       (WITH-STANDARD-IO-SYNTAX (PRINT *DB* OUT)))
; --> WITH-OPEN-STREAM LET 
; ==>
;   (OPEN FILENAME :DIRECTION :OUTPUT :IF-EXISTS :SUPERSEDE)
; 
; caught WARNING:
;   undefined variable: FILENAME
; 
; compilation unit finished
;   Undefined variable:
;     FILENAME
;   caught 1 WARNING condition
;   caught 1 STYLE-WARNING condition
STYLE-WARNING: redefining SAVE-DB in DEFUN
SAVE-DB
CL-USER> (defun save-db(filename)(with-open-file (out filename :direction :output :if-exists :supersede)(with-standard-io-syntax (print *db* out))))
STYLE-WARNING: redefining SAVE-DB in DEFUN
SAVE-DB
CL-USER> (save-db "/home/oslet/learning/lisp/my-cds.db")
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T)
 (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T)
 (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T)
 (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T)
 (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T)
 (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (defun load-db(filename)(with-open-file(in filename)(with-standard-io-syntax (setf *db* (read in)))))
LOAD-DB
CL-USER> (defun select(selector-fn)(remove-if-not selector-fn *db*))
SELECT
CL-USER> (select (where :rating 10))
((:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T))
CL-USER> (select (where :title "os" :rating 7))
((:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T))
CL-USER> 
