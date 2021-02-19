
;number of sublists where last atom is nonnumeric

(defun last_elem(l)
    (cond
        ((atom l) l)
        ((null (cdr l)) (car l))
        (T (last_elem (cdr l)))
    )
)

(defun f (l)
    (cond
        ((if (not (numberp (last_elem l)))
                1
                0
        ))
        ;; (T (apply #'+ (mapcar #'f l)))
    )
)

(defun f_mare (l)
    (if (not (numberp (last_elem l)))
            (1- (apply #'+ (mapcar #'f l)))
            (apply #'+ (mapcar #'f l))
    )
)