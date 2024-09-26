(defun f (l)
    (append (last l)
            (butlast (cdr l))
            (list (car l))))

(print (f `(1 2 3 4)))
