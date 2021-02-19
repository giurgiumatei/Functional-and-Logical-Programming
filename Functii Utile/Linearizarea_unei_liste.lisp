

(defun linearize (l)
	(cond
		((atom l) (list l))
		((listp l) (apply 'append (mapcar 'linearize l)))
	)
)
