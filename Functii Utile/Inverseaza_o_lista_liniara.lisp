

(defun invers(l)
	(cond
		((atom l) l)
		(t (append (invers (cdr l)) (list (car l))))
	)
)