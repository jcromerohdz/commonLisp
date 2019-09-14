;; make-cd function
(defun make-cd (title artist rating ripped)
   (list :title title :artist artist :rating rating :ripped ripped))

;; Test make-cd function
(defvar mycd (make-cd "Rose" "Kathy Mattea" 7 t))
(getf mycd :title)
(getf mycd :artist)

;; define global variable *db*
(dfevar *db* nil)

;; define add-record function
(defun add-record (cd) (push cd *db*))

;; use add-record and make-cd together to add CD's to the db
(add-record (make-cd "Roses" "Kathy Mettea" 7 t))
(add-record (make-cd "Fly" "Dixie Chicks" 8 t))
(add-record (make-cd "Home" "Dixie Chicks" 9 t))

;; Looking at the Database Contents
*db*

;; Implementing a dump-db function to output the records in a more
;; human-readable format
(defun dump-db ()
  (dolist (cd *db*)
     (format t "~{~a:~10t~a~%~}~%" cd)))

;; Improving the User Interaction, define a propt-read function
(defun prompt-read (prompt)
   (format *query-io* "~a: " prompt)
   (force-output *query-io*)
   (read-line *query-io*))

;; combine make-cd function with prompt-read to build a function that makes
;; a new CD record from data it gets by prompting for each value in turn
(defun prompt-for-cd ()
   (make-cd
     (prompt-read "Title")
     (prompt-read "Artist")
     (or (prompt-integer (prompt-read "Rating") :junk-allowed t) 0)
     (y-or-n-p "Ripped [y/n]: ")))

;; wrapping prompt-for-cd in a funtion that loops until the user is done.
(defun add-cds ()
   (loop (add-record (prompt-for-cd))
      (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

