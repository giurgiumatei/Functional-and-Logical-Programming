#||
 6.
 a) Write a function to test whether a list is linear.
 b) Write a function to replace the first occurence of an element E in a given list with an other element O.
 c) Write a function to replace each sublist of a list with its last element.
    A sublist is an element from the first level, which is a list.
    Example: (a (b c) (d (e (f)))) ==> (a c (e (f))) ==> (a c (f)) ==> (a c f)
  (a (b c) (d ((e) f))) ==> (a c ((e) f)) ==> (a c f)
 d) Write a function to merge two sorted lists without keeping double values
||#


;a)


(print "Requirement a:")
(defun is_linear(my_list)
    (cond
        ((null my_list) T)
        ((listp(car my_list)) nil)
        (T (is_linear (cdr my_list)))
    )


)

(print (is_linear '(1 2 3)))
(print (is_linear '(1 2 (3))))

;b)

(print "Requirement b:")
(defun replace_first(my_list E O)
	(cond
		((null my_list) nil)
		((= (car my_list) E) (cons O (cdr my_list)))
		(T (cons (car my_list) (replace_first (cdr my_list) E O)))
	)
)

(print (replace_first '(1 2 3 4 5 6) 3 0))

;c)

(print "Requirement c:")
(setq *print-case* :downcase)

(defun last_element(my_list)
	(if (listp my_list) (last_element (car (reverse my_list))) my_list)
)
;(print (last_element '(1 2 (3 (4 5)))))

(defun _reduce(my_list)
	(cond
		((null my_list) nil)
		((listp (car my_list)) (cons (last_element(car my_list)) (_reduce (cdr my_list))))
		(T (cons (car my_list) (_reduce(cdr my_list))))
	)
)
(print (_reduce '(a (b c) (d (e (f))))))


;d)

(print "Requirement d:")
(defun merge_sorted(a b)
	(cond
		((null a) b)
		((null b) a)
		((<= (car a) (car b)) (cons (car a) (merge_sorted (cdr a) b)))
		(T (cons (car b) (merge_sorted a (cdr b))))
	)
)
;(print (merge_sorted '(1 2 3) '(3 4 4 5 7)))

(defun remove_duplicates(my_list)
	(cond
		((null my_list) nil)
		((= (list-length my_list) 1) (cons  (car my_list) nil))
		((= (car my_list) (cadr my_list)) (remove_duplicates(cdr my_list)))
		(T (cons (car my_list) (remove_duplicates(cdr my_list))))
	)
	
)
;(print (remove_duplicates '(1 1 2 3 3 4 4 5 6)))

(defun solve_d(a b)
	(remove_duplicates (merge_sorted a b))
)
(print (solve_d '(1 2 3 4 5) '(1 2 3 6 7)))
	




	



