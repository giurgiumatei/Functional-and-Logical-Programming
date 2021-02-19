(defun repl(l e d)
    (cond 
        ((atom l) 
            (if (= 1 (mod d 2))
                (list l)
                (list e)
            )
        )
        (T (list (apply #'append (mapcar #'(lambda (l) (repl l e (1+ d))) l))))
    )
)

(defun replace_main (l e)
    (car (repl l e '0))
)

(print (replace_main '(a (b (g)) (c (d (e)) (f))) 'h))