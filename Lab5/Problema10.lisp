; 10.
; a) Write a function to return the product of all the numerical atoms from a list, at superficial level.
; b) Write a function to replace the first occurence of an element E in a given list with an other element
; O.
; c) Write a function to compute the result of an arithmetic expression memorised
;  in preorder on a stack. Examples:
;  (+ 1 3) ==> 4 (1 + 3)
;  (+ * 2 4 3) ==> 11 [((2 * 4) + 3)
;  (+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2))
; d) Write a function to produce the list of pairs (atom n), where atom appears for n times in the
; parameter list. Example:
;  (A B A B A C A) --> ((A 4) (B 2) (C 1))

;a)

(print "Requirement a:")
(defun product(my_list)
	(cond
		((null my_list) 1)
		((numberp (car my_list)) (* (car my_list) (product (cdr my_list))))
		(T (product(cdr my_list)))
	)
	
)
(print (product '(1 (2 3) 4 (2 (4)) 5)))

;b)

(print "Requirement b:")
(defun replace_first(my_list E O)
	(cond
		((null my_list) nil)
		((= (car my_list) E) (cons O (cdr my_list)))
		(T (cons (car my_list) (replace_first (cdr my_list) E O)))
	)
)

(print (replace_first '(1 2 3 1 4) 1 0))

;c)

(print "Requirement c:")
(defun __expression(op a b)
	(cond
		((string= op "+") (+ a b))
		((string= op "-") (- a b))
		((string= op "*") (* a b))
		((string= op "/") (floor a b))
	)
)


(defun _expression(my_list)
	(cond
		((null my_list) nil)
		((and (and (numberp (cadr my_list)) (numberp (caddr my_list))) (atom (car my_list))) (cons (__expression(car my_list) (cadr my_list) (caddr my_list)) (_expression(cdr (cdr (cdr my_list))))))
		(T (cons (car my_list) (_expression (cdr my_list))))
	)
)

(defun expression(my_list)
	(cond
		((null (cdr my_list)) (car my_list))
		(T (expression (_expression my_list)))
	)
)
(print (expression '(+ * 2 4 - 5 * 2 2)))

;d)

(print "Requirement d:")
(defun remove_element (my_list e)
	(cond
		((null my_list) nil)
		((string= (car my_list) e) (remove_element (cdr my_list) e))
		(T (cons (car my_list) (remove_element (cdr my_list) e)))
	)
)

(defun count_element (my_list e)
	(cond
		((null my_list) 0)
		((string= (car my_list) e) (+ 1 (count_element (cdr my_list) e)))
		(T (count_element (cdr my_list) e))
	)
)
;(print (count_element '(S A P A B A P) 'A))

(defun frequency (my_list)
	(cond
		((null my_list) nil)
		(T (cons (list (car my_list) (count_element my_list (car my_list))) (frequency (remove_element my_list (car my_list)))))
	)
)

(print (frequency '(A B A B A C A)))






