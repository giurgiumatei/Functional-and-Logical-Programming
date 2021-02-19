
(setq e 1)
(mapcar #' lambda(L) (cons e L)) '(2 3)) va produce ((1 2) (1 3))
(defun subm (L)
(cond
((null L) (list nil))
(t ((lambda (s)
(append s (mapcar #'(lambda (sb)
(cons (car L) sb)
)
s
)
)
)
(subm (cdr L)
)
)
)
)