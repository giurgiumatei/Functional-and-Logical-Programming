





%number of sublists having odd number of nonnumeric atoms at even levels

(defun flaten_numere(L K)
	(cond
		((null L) M)
		( (and (numberp L) (= (mod K 2 ) 0)) (list L))
		((atom L) nil)
		(t (apply #'append (mapcar #'(lambda (P) (flaten_numere P (+ K 1))) L)))
	)
)


(defun counter_odd(L NR)
	(cond
		((null L) NR)
		((oddp (car L) ) (counter_odd (cdr L) (+ 1 NR)))
		(t (counter_odd (cdr L) NR))
	
	)

)




(defun conditie (L)
	(cond 
		((null L) nil)
		(t (= (mod (counter_odd (flaten_numere L '1) 0) 2) 1))
	)

)

(defun f (L)

	(cond
		((null L) 0)
		((atom L) 0)
		((conditie L) (+ 1 (apply '+ (mapcar #'f L))))
		(t (apply '+ (mapcar #'f L)))
	)
)

(print (f '(a (b 2) (1 c 4) (1 (6 f)) (((g) 4)6))))