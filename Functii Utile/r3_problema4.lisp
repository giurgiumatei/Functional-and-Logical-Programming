

;atomii de pe nivelul k sunt inlocuiti cu 0

(defun f(L K D)
	(cond
		
		((and (atom L) (= K D)) 0)
		((atom L) L)
		(t (mapcar #'(lambda (Lst) (f Lst K (+ D 1))) L))
		
	)

)

(print (f '(A (1 (2 B)) ( C ( D))) 2 0) )