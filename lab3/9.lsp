(defun insert-before-if (lst predicate)
    (cond
        ((null lst) nil)
        ((funcall predicate (car lst))
            (cons '* (cons (car lst) (insert-before-if (cdr lst) predicate))))
        (t (cons    (car lst) 
                    (insert-before-if (cdr lst) predicate)))))

(print (insert-before-if '(-1 2 -3 0 5) (lambda (x) (and (numberp x) (>= x 0)))))
(print (insert-before-if '(1 2 3 4 5 6) #'evenp))