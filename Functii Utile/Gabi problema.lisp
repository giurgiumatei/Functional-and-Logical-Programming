;;;; Write a LISP program to determine the number of sublists at any level of a given list,
;;;; where the maximal numeric atom on all odd levels is even. The list processing will be done using
;;;; a MAP function. For example, the list (A (B 2) (1 C 4) (D 1 (6 F)) ( (G 4) 6) ) has 4 such sublists: the list, (B 2), (1 C 4), ((G) 4 ) and (((G) 4) 6).



(defun flaten_numere(L K)
	(cond
		((null L) M)
		( (and (numberp L) (= (mod K 2 ) 0)) (list L))
		((atom L) nil)
		(t (apply #'append (mapcar #'(lambda (P) (flaten_numere P (+ K 1))) L)))
	)
)

(defun maxim (L M)
	(cond
		((null L) M)
		(t (maxim (cdr L) (max (car L) M )))
	)


)

(defun conditie (L)
	(cond 
		((null L) nil)
		(t (= (mod (maxim (flaten_numere L '1) -1) 2) 0))
	)

)

(defun f (L)

	(cond
		((null L) 0)
		((atom L) 0)
		((conditie L) (print L) (+ 1 (apply '+ (mapcar #'f L))))
		(t (apply '+ (mapcar #f L)))
	)
)