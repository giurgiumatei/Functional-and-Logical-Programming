
;la nivel superficial
(defun suma(l)
	(cond
		((null l) 0) ;;daca lista e nula
		((numberp(car l)) (+ (car l) (suma(cdr l ) ) ) ) ;;daca elementul e numar
		(t (suma(cdr l))) ;;altfel
	)
)





(print (suma '(1( 2 (3 4) 5 ) 1 )) )

;la orice nivel

(defun suma(l)
	(cond
		((null l) 0) ;;daca lista e nula
		((numberp(car l)) (+ (car l) (suma (cdr l)))) ;;daca elementul e numar
		((atom (car l)) (suma (cdr l))) ;;daca elementul nu e numar, dar nici lista
		(t (+ (suma (car l)) (suma (cdr l)))) ;;daca elementul este sublista
	)
)
(print (suma '(1( 2 (3 4) 5 ) 1 )) )