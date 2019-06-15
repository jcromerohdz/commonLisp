Atomic
42
t
nil
pi

;;expressions
(+ 1 2)
(+ 1 2 10 7 5)
(/ (+ 10 20) 2)
(* (+ 42 58)
   (- (. 8 2) 2))

;;Semantics
(expt (- 8 4) 2)

Creating our own functions
(defun name (paramete1... parametern) body)
example
(defun averege (x y)
    (/ (+ x y ) 2))

;;Factorial function example
(defun ! (n)
   (if (= n 0)
    1
    (* n (! (- n 1)))))

;;More efficient way to define n! recursively
(defun ! (n)
   (!-aux 1 1 n))

(defun !-aux (r i n)
    (if (> i n)
        r
        (!-aux (* i r)
                (+ i 1)
                n)))
