

%generate a new list with every nth element removed
(defun f(l n nn)
	(cond
		((null l) nil)
		( (= n 1) (cons (cadr l) (f (cddr l) (- nn 1) nn) ) )
		(T (cons (car l) (f (cdr l) (- n 1) nn)))
	)
	
)


(print (f '(1 2 3 4 5 6 7) 2 2))