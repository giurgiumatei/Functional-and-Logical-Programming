;replace all even value with next numeric value
(defun repl (l)
    (cond 
        ((numberp l) 
            (if (= 0 (mod l 2))
                 (1+ l)
                 l
            )
        )
        ((atom l) l)
        (T (mapcar #'repl l))
    )
)

(defun replace_main (l)
    (repl l)
)

(print (replace_main '(1 s 4 (2 f (7)))))