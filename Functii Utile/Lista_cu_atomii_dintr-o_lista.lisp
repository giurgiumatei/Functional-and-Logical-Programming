
(defun atomi (L)
(cond
((atom L) (list L))
(t (mapcan #'atomi L))
)
)