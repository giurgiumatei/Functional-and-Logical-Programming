

(defun parcurg_st(arb nv nm)
(cond
((null arb) nil)
((= nv (+ 1 nm)) nil)
(t (cons (car arb) (cons (cadr arb) (parcurg_st (cddr arb) (+ 1 nv) (+ (cadr arb) nm)))))
)
)


(defun stang(arb)
(parcurg_st (cddr arb) 0 0)
)

(print (stang ' (a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) ))