
(defun insPrimaPoz(e l)
(cond
((null l) nil)
(t (cons (cons e (car l)) (insPrimaPoz e (cdr l))))
)
)

(defun subm(l)
(cond
((null l) (list nil))
(t (append (subm (cdr l)) (insPrimaPoz (car l) (subm (cdr l)))))
)
)

(print (subm '(1 2)))