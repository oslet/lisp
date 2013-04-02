; SLIME 2011-02-04
CL-USER> (defun select(selector-fn)(remove-if-not selector-fn *db*))
;Compiler warnings :
;   In SELECT: Undeclared free variable *DB*
SELECT
CL-USER> (defvar *db* nil)
*DB*
CL-USER> (defvar *db* t)
*DB*
CL-USER> (def ar *db* nil)
Invoking restart: Return to SLIME's top level.
; Evaluation aborted on #<UNBOUND-VARIABLE #x187A3AB6>.
CL-USER> (defvar *db* nil)
*DB*
CL-USER> (defun select(selector-fn)(remove-if-not selector-fn *db*))
SELECT
CL-USER> (defun where(&key title artist rating (ripped nil ripped-p))(and #'(lambda(cd)(if title (equal(getf cd :title) title) t)(if artist (equal(getf cd :artist) artist)t)(if rating (equal(getf cd :rating) rating) t)(if ripped-p(equal(getf cd :ripped)ripped)t))))
WHERE
CL-USER> (defun load-db(filename)(with-open-file(in filename)(with-standard-io-syntax (setf *db* (read in)))))
LOAD-DB
CL-USER> (load-db "/home/oslet/learning/lisp/20130324.db")
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::SIMPLE-FILE-ERROR #x187BF9B6>.
CL-USER> (load-db "/home/oslet/learning/lisp/20130324/my-cds.db")
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (select (where :rating 8))
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (select)
Invoking restart: Kill this thread
; Evaluation aborted on #<CCL::TOO-FEW-ARGUMENTS #x187DE156>.
CL-USER> (select (where :title "el"))
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (defun where(&key title artist rating (ripped nil ripped-p))(and #'(lambda(cd)(if title (equal(getf cd :title) title) t)(if artist (equal(getf cd :artist) artist) t)(if rating (equal(getf cd :rating) rating) t)(if ripped-p (eqaul(getf cd :ripped) ripped) t))))
;Compiler warnings :
;   In an anonymous lambda form inside WHERE: Undefined function EQAUL
WHERE
CL-USER> (defun where(&key title artist rating (ripped nil ripped-p))(and #'(lambda(cd)(if title (equal(getf cd :title) title) t)(if artist (equal(getf cd :artist) artist) t)(if rating (equal(getf cd :rating) rating) t)(if ripped-p (equal(getf cd :ripped) ripped) t))))
WHERE
CL-USER> (select (where :title "el"))
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (defun where(&key title artist rating (ripped nil ripped-p))#'(lambda(cd)(and (if title (equal(getf cd :title)title) t)(if artist (eqaul(getf cd :artist)artist)t)(if rating (equal(getf cd :rating) rating )t)(if ripped-p(equal(getf cd :ripped) ripped)t))))
;Compiler warnings :
;   In an anonymous lambda form inside WHERE: Undefined function EQAUL
WHERE
CL-USER> (defun where(&key title artist rating (ripped nil ripped-p))#'(lambda(cd)(and (if title (equal(getf cd :title)title) t)(if artist (equal(getf cd :artist)artist)t)(if rating (equal(getf cd :rating) rating )t)(if ripped-p(equal(getf cd :ripped) ripped)t))))
WHERE
CL-USER> (select (where :title "el"))
((:TITLE "el" :ARTIST "os" :RATING 8 :RIPPED T))
CL-USER> (select (where :rating 9))
((:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T))
CL-USER> (defun update(selector-fn &key title artist rating (ripped nil ripped-p))(setf *db* (mapcar #'(lambda(row)(where (funcall selector-fn row)(if title (setf(getf row :title) title))(if artist (setf (getf row :artist) artist))(if rating (setf (getf row :rating) rating))(if ripped (setf (getf row :ripped) ripped))) row) *db*)))
;Compiler warnings :
;   In an anonymous lambda form inside UPDATE: In the call to WHERE with arguments ((FUNCALL SELECTOR-FN ROW) (IF TITLE (SETF (GETF ROW :TITLE) TITLE)) (IF ARTIST (SETF (GETF ROW :ARTIST) ARTIST)) (IF RATING (SETF (GETF ROW :RATING) RATING)) (IF RIPPED (SETF (GETF ROW :RIPPED) RIPPED))),
;     the variable portion of the argument list ((FUNCALL SELECTOR-FN ROW) (IF TITLE (SETF (GETF ROW :TITLE) TITLE)) (IF ARTIST (SETF (GETF ROW :ARTIST) ARTIST)) (IF RATING (SETF (GETF ROW :RATING) RATING)) (IF RIPPED (SETF (GETF ROW :RIPPED) RIPPED))) contains an odd number
;     of arguments and so can't be used to initialize keyword parameters
;     for the current global definition of WHERE
;   In UPDATE: Unused lexical variable RIPPED-P
UPDATE
CL-USER> (defun update(selector-fn &key title artist rating (ripped nil ripped-p))(setf *db* (mapcar #'(lambda(row)(where (funcall selector-fn row)(if title (setf(getf row :title) title))(if artist (setf (getf row :artist) artist))(if rating (setf (getf row :rating) rating))(if ripped-p (setf (getf row :ripped) ripped))) row) *db*)))
;Compiler warnings :
;   In an anonymous lambda form inside UPDATE: In the call to WHERE with arguments ((FUNCALL SELECTOR-FN ROW) (IF TITLE (SETF (GETF ROW :TITLE) TITLE)) (IF ARTIST (SETF (GETF ROW :ARTIST) ARTIST)) (IF RATING (SETF (GETF ROW :RATING) RATING)) (IF RIPPED-P (SETF (GETF ROW :RIPPED) RIPPED))),
;     the variable portion of the argument list ((FUNCALL SELECTOR-FN ROW) (IF TITLE (SETF (GETF ROW :TITLE) TITLE)) (IF ARTIST (SETF (GETF ROW :ARTIST) ARTIST)) (IF RATING (SETF (GETF ROW :RATING) RATING)) (IF RIPPED-P (SETF (GETF ROW :RIPPED) RIPPED))) contains an odd number
;     of arguments and so can't be used to initialize keyword parameters
;     for the current global definition of WHERE
UPDATE
CL-USER> (defun update(selector-fn &key title artist rating (ripped nil ripped-p))(setf *db* (mapcar #'(lambda(row)(while (funcall selector-fn row)(if title (setf(getf row :title) title))(if artist (setf (getf row :artist) artist))(if rating (setf (getf row :rating) rating))(if ripped-p (setf (getf row :ripped) ripped))) row) *db*)))
;Compiler warnings :
;   In an anonymous lambda form inside UPDATE: Undefined function WHILE
UPDATE
CL-USER> (defun update(selector-fn &key title artist rating (ripped nil ripped-p))(setf *db* (mapcar #'(lambda(row)(when (funcall selector-fn row)(if title (setf(getf row :title) title))(if artist (setf (getf row :artist) artist))(if rating (setf (getf row :rating) rating))(if ripped-p (setf (getf row :ripped) ripped))) row) *db*)))
UPDATE
CL-USER> (update (where :title "el") :rating 101010)
((:TITLE "el" :ARTIST "os" :RATING 101010 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (select (where :title "el"))
((:TITLE "el" :ARTIST "os" :RATING 101010 :RIPPED T))
CL-USER> (defun remove-rows(selector-fn)(setf *db* (remove-if selector-fn *db*)))
REMOVE-ROWS
CL-USER> *db*
((:TITLE "el" :ARTIST "os" :RATING 101010 :RIPPED T) (:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (remove-rows (where :artist "os"))
((:TITLE "os" :ARTIST "el" :RATING 7 :RIPPED T) (:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> (remove-rows (where :title "os"))
((:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> *db*
((:TITLE "home" :ARTIST "Dixie Chicks" :RATING 10 :RIPPED T) (:TITLE "fly" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T) (:TITLE "roses" :ARTIST "kathy" :RATING 8 :RIPPED T) (:TITLE "oslet" :ARTIST "eletmc" :RATING 7 :RIPPED T))
CL-USER> 