; SLIME 2011-02-04
CL-USER> (defun make-cd(title artist rating ripped)(list :title title :artist artist :rating rating :ripped ripped))
MAKE-CD
CL-USER> (defvar *db* nil)
*DB*
CL-USER> (defun add-record(cd)(push cd *db*))
ADD-RECORD
CL-USER> 