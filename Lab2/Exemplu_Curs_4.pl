p([], 0).
p([H|T], S) :-
!,
H > 0,
p(T, S1),
S is S1 + H.
p([_|T], S) :- p(T, S).
