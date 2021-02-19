
(defun PAR (L)
(cond
((= 0 (mod (length L) 2)) t)
(t nil)
)
)
(defun nr (L)
(cond
((atom L) 0)
((PAR L) (+ 1 (apply #'+ (mapcar #'nr L))))
(t (apply #'+ (mapcar #'nr L)))
)
)