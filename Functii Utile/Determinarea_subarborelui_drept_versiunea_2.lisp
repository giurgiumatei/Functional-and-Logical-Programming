
(defun parcurg_dr(arb nv nm)
(cond
((null arb) nil)
((= nv (+ 1 nm)) arb)
(t (cons (car arb) (cons (caddr arb) (parcurg_dr (cddr arb) (+ 1 nv) (+ (caddr arb) nm)))))
)
)

(defun drept(arb)
(parcurg_dr (cddr arb) 0 0)
)

(print (drept ' (a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) ))

;;nu merge