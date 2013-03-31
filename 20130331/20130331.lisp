; SLIME 2011-02-04
CL-USER> (defun make-cd(title artist rating ripped)(list :title title :artist artist :rating rating :ripped ripped))
MAKE-CD
CL-USER> (defvar *db* nil)
*DB*
CL-USER> (defun add-record(cd)(push cd *db*))
ADD-RECORD
CL-USER> (make-cd "roses" "kathy" 7 t)
(:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T)
CL-USER> (add-record (make-cd "roses" "kathy" 7 t))
((:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (add-record (make-cd "fly" "home" 6 t))
((:TITLE "fly" :ARTIST "home" :RATING 6 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (defun prompt-read(prompt)(format t "~a: "prompt)(force-output *query-io*)(read-line *query-io*))
PROMPT-READ
CL-USER> (defun prompt-for-cd()(make-cd (prompt-read "title")(prompt-read "artist")(or(parse-integer(prompt-read "rating") :junk-allowed t) 0)(y-or-n-p "ripped [y/n]:")))
PROMPT-FOR-CD
CL-USER> (prompt-for-cd)
title: oslet
artist: eletmc
rating: 6

ripped [y/n]: (y or n)  y

(:TITLE "oslet" :ARTIST "eletmc" :RATING 6 :RIPPED T)
CL-USER> (defun add-cds()(loop (add-record(prompt-for-cd))(if(not(y-or-n-p "Another? [y/n]")(return)))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x1879C046>.
CL-USER> (defun add-cds()(loop (add-record(prompt-for-cd))(if(not(y-or-n-p "Another? [y/n]")(return)))))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187B81B6>.
CL-USER> (defun add-cds()(loop (add-record(prompt-for-cd))(if(not(y-or-n-p "Another? [y/n]"))(return))))
ADD-CDS
CL-USER> (add-cds)
title: oslet
artist: eletmc
rating: 7

ripped [y/n]: (y or n)  y

Another? [y/n] (y or n)  y
title: et
artist: mc
rating: 8

ripped [y/n]: (y or n)  y

Another? [y/n] (y or n)  n

NIL
CL-USER> *db*
((:TITLE "et" :ARTIST "mc" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T) (:TITLE "fly" :ARTIST "home" :RATING 6 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (remove-if-not #'evenp(1 2 3 4 5 6 7 8 9 10))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187D4206>.
CL-USER> (remove-if-not #'evenp '(1 2 3 4 5 6 7 8 9 10))
(2 4 6 8 10)
CL-USER> (remove-if-not #'(lambda(cd)(equal(getf cd :artist) artist *db*)))
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-PROGRAM-ERROR #x187EC5D6>.
CL-USER> (remove-if-not #'(lambda(cd)(equal(getf cd :artist) artist)) *db*)
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable ARTIST
Invoking restart: Kill this thread
; Evaluation aborted on #<UNBOUND-VARIABLE #x1880729E>.
CL-USER> (remove-if-not #'(lambda(cd)(equal(getf cd :artist) artist ) *db*))
;Compiler warnings :
;   In an anonymous lambda form: Undeclared free variable ARTIST
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x188214EE>.
CL-USER> (remove-if-not #'(lambda(cd)(equal(getf cd :artist) "mc")) *db*)
((:TITLE "et" :ARTIST "mc" :RATING 8 :RIPPED T))
CL-USER> (defun select-by-artist(artist)#'(lambda(cd)(equal(getf cd :artist) artist)) *db*)
SELECT-BY-ARTIST
CL-USER> (select-by-artist "mc")
((:TITLE "et" :ARTIST "mc" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T) (:TITLE "fly" :ARTIST "home" :RATING 6 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 7 :RIPPED T))
CL-USER> (defun select-by-artist(artist)(remove-if-not #'(lambda(cd)(equal(getf cd :artist) artist)) *db*))
SELECT-BY-ARTIST
CL-USER> (select-by-artist "mc")
((:TITLE "et" :ARTIST "mc" :RATING 8 :RIPPED T))
CL-USER> 