(defun intersection-sets (set1 set2)
    (cond
        ((null set1) nil)
        ((member (car set1) set2)
            (cons (car set1) (intersection-sets (cdr set1) set2)))
        (t (intersection-sets (cdr set1) set2))))

(print (intersection-sets '(1 2 3 4) '(3 4 5 6)))