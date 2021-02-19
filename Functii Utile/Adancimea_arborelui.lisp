

;; pt varianta 2

(defun adancime(L)
(cond
((null (cdr L)) 0)
(t (+ 1 (apply #'max
(mapcar #'adancime (cdr L))
)
)
)
)
)