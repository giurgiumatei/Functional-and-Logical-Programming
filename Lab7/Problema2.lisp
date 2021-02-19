;;;;2. Write a function that returns the sum of numeric atoms in a list, at any level.



(defun suma (L)
(cond
((numberp L) L)
((listp L) (apply #'+ (mapcar #'suma L)))
(t 0)
)
)

(print (suma '(1 2 3))) ;;must be 6
(print (suma '(1 2 (3 4) (5 (6 7))))) ;;must be 28
(print (suma '(a b c))) ;;must be 0
(print (suma '(1 (2 a) (3 b c) 4))) ;;must be 10