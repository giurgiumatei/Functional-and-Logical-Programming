
(defun inserare(e arb)
(cond
((null arb) (list e))
((<= e (car arb)) (list (car arb) (inserare e (cadr arb)) (caddr arb)))
(t (list (car arb) (cadr arb) (inserare e (caddr arb))))
)
)

(defun construire(l)
(cond
((null l) nil)
(t (inserare (car l) (construire (cdr l))))
)
)

(defun inordine (arb)
(cond
((null arb) nil)
(t (append (inordine (cadr arb)) (list (car arb)) (inordine (caddr arb))))
)
)

(defun sortare(l)
(inordine (construire l))
)

(print (sortare '(5 1 4 6 3 2 )))