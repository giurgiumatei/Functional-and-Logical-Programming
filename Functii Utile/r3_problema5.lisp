



;opusul problemei lui gabi

(defun flaten_numere(L K)
	(cond
		((null L) M)
		( (and (numberp L) (= (mod K 2 ) 1)) (list L))
		((atom L) nil)
		(t (apply #'append (mapcar #'(lambda (P) (flaten_numere P (+ K 1))) L)))
	)
)

(defun minim (L M)
	(cond
		((null L) M)
		(t (minim (cdr L) (min (car L) M )))
	)


)

(defun conditie (L)
	(cond 
		((null L) nil)
		(t (= (mod (minim (flaten_numere L '1) 100) 2) 0))
	)

)

(defun f (L)

	(cond
		((null L) 0)
		((atom L) 0)
		((conditie L)  (+ 1 (apply '+ (mapcar #'f L))))
		(t (apply '+ (mapcar #'f L)))
	)
)

(print (f '(A ( B 2 ) (2 C 4) (1 (3 F)) (((G)4)2))))