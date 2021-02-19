;;;;9. Write a function that removes all occurrences of an atom from any level of a list.



(defun __remove(e l)
	(cond	
		((atom l) l)
		((listp l)  (mapcar #'(lambda(l)(__remove e l )) (remove e l :test #'equal)))
	)

)

(defun _remove(e l)
	
	(__remove  e (remove e l :test #'equal))
	
	(print (eq e 3)) ;ca sa vezi daca elementul ii 3
	(print l) ;ca sa afiseze lista
	
)

;(print (_remove 1 '(1 (2 3) (1 (2 3)) 1) ))




;;problema de pe subiectul lui dicianu

(defun linearize (l)
	(cond
		((atom l) (list l))
		((listp l) (apply 'append (mapcar 'linearize l)))
	)
)


(defun solve(normalised_list l)
	(cond
		((null normalised_list) l)
		((and (numberp (car normalised_list)) (=(mod (car normalised_list) 3) 0)) ( _remove (car normalised_list) l)  (solve (cdr normalised_list) l))
		(t (solve (cdr normalised_list) l))
	)
		

)


(defun _solve(l)

	(setq normalised_list (linearize l))
	;(print normalised_list)
	(solve normalised_list l)
		
	

)

(print (_solve '(1 (2 3) (1 (2 3)) 1) ))
