

(defun fct (L)
(cond
((null (car L)) nil)
(t (cons
(mapcar #'car L)
(fct (mapcar #'cdr L))
)
)
)
)
(fct '((1 2 ) (4 5) (7 8))) → ((1 4 7) (2 5 8))
