;;remove occurences of element e

(defun repl (l e)
    (cond
        ((equal l e) nil)
        ((atom l) (list l))
        (T (list (mapcan #'(lambda (x) 
                            (repl x e)
                    ) l
           ))
        )
    )
)

(defun replace_main (l e)
    (car (repl l e))
)


(print (replace_main '(1 (2 A (3 A)) (A)) 'A))