;la nivel superficial

(defun ultim(x)
	(cond
		((atom x) x)
		((null(cdr x)) (car x))
		(t (ultim(cdr x)))
	
	
	)

)