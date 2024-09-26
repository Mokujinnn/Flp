(defun add-symbol (L symbol)
    (cond
        ((null L) nil)
        ((and (numberp (car L)) (>= (car L) 0))
         (cons  (list (car L) symbol)
                (add-symbol (cdr L) symbol)))
        (t (cons (car L)
            (add-symbol (cdr L) symbol)))))
