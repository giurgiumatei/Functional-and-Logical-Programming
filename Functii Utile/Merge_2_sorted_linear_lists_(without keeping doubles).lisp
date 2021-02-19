

(defun merge(l r)
	(cond
		((and (null l) (null r)) nil)
		((null l) r)
		((null r) l)
		((< (car l) (car r))
		(cons (car l) (merge (cdr l) r))
		)
		((= (car l) (car r))
		(cons (car l) (merge (cdr l) (cdr r)))
		)
		(T 
		(cons (car r) (merge l (cdr r))))
		)
		)