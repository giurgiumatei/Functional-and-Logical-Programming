% a. Write a predicate to determine the difference of two sets.
% A - B means elements of A which are not the elements of B.
% b. Write a predicate to add value 1 after every even element from a list.

%a

contains([V|_],V):-!.
contains([_|T],V):-
    contains(T,V).

difference([],_,[]).
difference([H|T],SET2,R):-
    contains(SET2,H),
    difference(T,SET2,R),!.
difference([H|T],SET2,[H|R]):-
    difference(T,SET2,R).

%b

add([],[]).
add([H|T],[H|R]):-
    H mod 2 =\=0,
    add(T,R).
add([H|T],[H,1|R]):-
    H mod 2 =:= 0,
    add(T,R).
