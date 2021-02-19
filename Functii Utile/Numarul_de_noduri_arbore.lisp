
;; pt varianta 2

(defun nrNoduri(L)
(cond
((null (cdr L)) 1)
(t (+ 1 (apply #'+
(mapcar #'nrNoduri (cdr L))
)
)
)
)
)