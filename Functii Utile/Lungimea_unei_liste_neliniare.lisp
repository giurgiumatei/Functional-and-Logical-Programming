

(defun LG (L)
(cond
((atom L) 1)
(t (apply #'+ (mapcar #'LG L)))
)
)