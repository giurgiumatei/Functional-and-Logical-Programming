

(defun lista(e l)
	(cond
		((null l) nil)
		(t (cons (list e (car l)) (lista e (cdr l))))
	)
)

(defun per(e l)
	(cond
		((null l) nil)
		(T (cond
			((< e (car l)) (cons (list e (car l)) (per e (cdr l))))
			(T (per e (cdr l)))
			)
		)
	)
)

(defun perechi(l)
	(cond
		((null l) nil)
		(t (append (per (car l) (cdr l)) (perechi (cdr l))))
	
	)
	
)