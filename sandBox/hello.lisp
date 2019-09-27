(defun hello ()
  (write-line "What is your name?")
  (let ((name (read-line)))
    (format t "Hello, ~A.~%" name)))

(defun add1 (n)
  (+ n 1))

(defun add2 (n)
  (add1 (add1 n)))

(defun isodd? (n)
  (oddp n))
