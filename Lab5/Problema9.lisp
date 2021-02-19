; 9.
; a) Write a function that merges two sorted linear lists and keeps double values.
; b) Write a function to replace an element E by all elements of a list L1 at all levels of a given list L.
; c) Write a function to determines the sum of two numbers in list representation, and returns the
; corresponding decimal number, without transforming the representation of the number from list to
; number.
; d) Write a function to return the greatest common divisor of all numbers in a linear list.

;a)

(print "Requirement a:")

(defun merge_sorted(a b)
	(cond
		((null a) b)
		((null b) a)
		((<= (car a) (car b)) (cons (car a) (merge_sorted (cdr a) b)))
		(T (cons (car b) (merge_sorted a (cdr b))))
	
	)
)

(print (merge_sorted '(1 2 3) '(3 4 4 5 7)))

;b)

(print "Requirement b:")

(defun replace_element(l e r)
	(cond
		((null l) nil)
		((listp (car l)) (cons (replace_element (car l) e r) (replace_element (cdr l) e r)))
		((= (car l) e) (append r (replace_element (cdr l) e r)))
		(T (cons (car l) (replace_element (cdr l) e r)))

	)

)

(print (replace_element '(1 (2 1 2) 2 2 ( 2 ( 1 ) )) 1 '(3 3) ))