(setq l `(((1 (2 *)) 3) 4))
(print (car (cdr (car (cdr (car (car l)))))))