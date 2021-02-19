%a. Write a predicate to compute the intersection of two sets.
%b. Write a predicate to create a list (m, ..., n) of all integer numbers from the interval [m, n].

%a

member([V|_],V):-!.
member([_|T],V):-
    member(T,V).

intersection([],_,[]).
intersection([H|T],SET,[H|R]):-
    member(SET,H),
    intersection(T,SET,R),!.
intersection([_|T],SET,R):-
    intersection(T,SET,R).

%b

range(M,N,[]):-
    M>N,!.
range(M,N,[M|R]):-
    M1 is M + 1,
    range(M1,N,R).
