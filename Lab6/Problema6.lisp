;;;12. Determine the list of nodes accesed in preorder in a tree of type (2).

(print "Inorder: ")
(defun inorder(l)
(cond
((null l) nil)
(t (append (inorder (cadr l)) (list (car l)) (inorder (caddr l))))
)
)

(print (inorder '(a (b () (f)) (d (e)))))

;;for the requirement
(print "Preorder: ")
(defun preorder(l)
(cond
((null l) nil)
(t (append (list (car l)) (preorder (cadr l))  (preorder (caddr l))))
)
)

(print (preorder '(a (b () (f)) (d (e)))))


(print "Postorder: ")
(defun postorder(l)
(cond
((null l) nil)
(t (append (postorder (cadr l))  (postorder (caddr l)) (list (car l))))
)
)

(print (postorder '(a (b () (f)) (d (e)))))