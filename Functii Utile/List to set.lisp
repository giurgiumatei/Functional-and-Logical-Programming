

(defun apare (E L)
	(cond
		((null L) NIL)
		((eq (car L) E) T)
		(t (apare E (cdr L)) )
	)
)

(defun to_set (L C)
	(cond
		((null L) C)
		((not (apare (car L) C))  (to_set (cdr L) (cons (car L) C)))
		(t (to_set (cdr L) C))
	)
)

(print (to_set '(1 2 3 2 1 2 3) '()))