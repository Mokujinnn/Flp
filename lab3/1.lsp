(defun my-subsetp (set1 set2)
  (cond
        ((null set1) t)
        ((member (car set1) set2)
            (my-subsetp (cdr set1) set2))
        (t nil)))

(defun equal-sets (set1 set2)
    (and    (my-subsetp set1 set2)
            (my-subsetp set2 set1)))


(print (equal-sets '(1 1 2 3) '(3 2 2 2 1)))