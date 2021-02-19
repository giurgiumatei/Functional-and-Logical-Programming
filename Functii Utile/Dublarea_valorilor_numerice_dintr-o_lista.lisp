

(defun dublare(l)
	(cond
		((numberp l) (* 2 l))
		((atom l) l)
		(t (cons (dublare (car l)) (dublare (cdr l))))
	)

)