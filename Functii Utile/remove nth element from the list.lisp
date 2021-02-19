

(defun remove-nth (l n)
	(cond
		((null l) nil)
		((= n 1) (cdr l))
		(T (cons (car l) (remove-nth (cdr l) (- n 1))))
	)
)