; 2.
; a) Write a function to return the product of two vectors.
; b) Write a function to return the depth of a list. Example: the depth of a linear list is 1.
; c) Write a function to _sort a linear list without keeping the double values.
; d) Write a function to return the _intersection of two sets.

;a)

(print "Requirement a:")
(defun dot_product (a b)
	(if (null a)
		0
		(+ (* (car a) (car b)) (dot_product (cdr a) (cdr b)))
	)
)

(print (dot_product '(1 2 3) '(4 5 6)))

;b)

(print "Requirement b:")

(defun list_depth (a depth)
	(cond
		((null a) depth)
		((listp (car a)) (max (list_depth (car a) (+ depth 1)) (list_depth (cdr a) depth)))
		(T (list_depth (cdr a) depth))
	)
)

(print (list-depth '(1 (2 (3 4) ( 1 ( 2 ( 3 ) ) )) (5 6)) 1))

; c)

(print "Requirement c:")
(defun insert (l e)
	(if (null l)
		(list e)
		(progn
			(setf r (insert (cdr l) e))
			(cons (min (car l) (car r)) (cons (max (car l) (car r)) (cdr r)))
		)
	)
)

;(print (insert (insert (insert (insert nil 4) 3) 6) 1))


(defun _sort (l)
	(if (null l)
		nil
		(insert (_sort (cdr l)) (car l))
	)
)

;(print (_sort '(4 2 5 3 6 7)))


(defun count-occurences (l e)
	(cond
		((null l) 0)
		((= (car l) e) (+ 1 (count-occurences (cdr l) e)))
		(T (count-occurences (cdr l) e))
	)
)

;(print (count-occurences '(1 1 2 3 4) 1))


(defun remove-elem (l e)
	(cond
		((null l) nil)
		((= (car l) e) (remove-elem (cdr l) e))
		(T (cons (car l) (remove-elem (cdr l) e)))
	)
)

;(print (remove-elem '(1 1 2 3 4) 1))


(defun remove-doubles (l)
	(cond
		((null l) nil)
		((> (count-occurences l (car l)) 1) (remove-doubles (remove-elem l (car l))))
		(T (cons (car l) (remove-doubles (cdr l))))
	)
)

;(print (remove-doubles '(1 1 2 3 3 4)))


(defun sort-without-doubles (l)
	(_sort (remove-doubles l))
)

(print (sort-without-doubles '(6 3 5 2 2 1 3)))


; d)

(print "Requirement d:")
(defun _intersection (a b)
	(cond
		((null a) nil)
		((> (count-occurences b (car a)) 0) (cons (car a) (_intersection (cdr a) b)))
		(T (_intersection (cdr a) b))
	)
)

(print (_intersection '(1 2 3 4 5) '(0 1 2 3 10)))

