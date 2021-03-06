% 1. Write a predicate to generate the list of all subsets with all elements of a given list.
% Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

sublists([],[]).
sublists([H|T],[H|R]):-
    sublists(T,R).
sublists([_|T],R):-
    sublists(T,R).

process(L,N,R):-
    sublists(L,R),
    length(R,N).

all_solutions(L,N,R):-
    findall(AUX,process(L,N,AUX),R).
