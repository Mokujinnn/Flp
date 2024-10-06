(defun sum-pairs (L)
    (cond
        ((null L) nil)
        ((null (cdr L)) L)
        (t (cons    (+ (car L) (car (last L)))
                    (sum-pairs (butlast (cdr L)))))))

(print (sum-pairs `(1 -2 -3 4 5 6 -7 8 9)))