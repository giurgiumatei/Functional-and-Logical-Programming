 ; 1.
; a) Write a function to return the n-th element of a list, or NIL if such an element does not exist.
; b) Write a function to check whether an atom E is a _member of a list which is not necessarily linear.
; c) Write a function to determine the list of all sublists of a given list, on any level.
;  A sublist is either the list itself, or any element that is a list, at any level. Example:
;  (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
;  ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )
; d) Write a function to transform a linear list into a set.


;a)

(print "Requirement a:")

(defun nth-element( l k)
	(cond
		((null l) nil)
		((= k 1) (car l))
		(T (nth-element(cdr l) (- k 1)))
	
	)

)

(print (nth-element '(1 2 3 4) 3))

;b)
(print "Requirement b:")

(defun is_member(l e)
	(cond
		((null l) nil)
		((listp (car l)) (or (is_member (car l) e) (is_member (cdr l) e)))
		((= (car l) e) T)
		(T (is_member (cdr l) e))
	)
)
(print (is_member '(1 (2 3) (4 (5 6))) 3))

;c
(print "Requirement c:")

(defun sublists (l first_touch)
	(cond
		((null l) nil)
		((= first_touch 1) (cons l (sublists l 0)))
		((listp (car l)) (append (sublists (car l) 1) (sublists (cdr l) 0)))
		(T (sublists (cdr l) 0))
	)

)


(print (sublists '(1 2 (3 (4 5) (6 7)) 8 (9 10)) 1))

;d)
(print "Requirement d:")

(defun make_set (l)
	(if (null l)
		nil
		(progn
			(setf result (make_set (cdr l)))
			(if (is_member result (car l))
				result
				(cons (car l) result)
			)
		)
	)
)
(print (make_set '(1 2 3 1 3 1 4)))

