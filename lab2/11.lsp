(defun merge-alternating (L1 L2)
    (cond
        ((null L1) L2)
        ((null L2) L1)
        (t  (cons   (car L1)
                    (cons   (car L2) 
                            (merge-alternating (cdr L1) (cdr L2)))))))

(print (merge-alternating `(1 2 3 4 5 6 7 8) `(a s d f)))