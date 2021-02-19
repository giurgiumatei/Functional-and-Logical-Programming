
(defun adaug(e l)
	(cond
		((null l) (list e))
		(t (cons (car l) (adaug e (cdr l))))
	
	)

)
