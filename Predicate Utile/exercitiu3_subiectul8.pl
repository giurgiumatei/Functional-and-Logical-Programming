

%list of subsets of even length


subm([],[]).
subm([H|T],[H|R]):-subm(T,R).
subm([_|T],R):-subm(T,R).

is_even(N):-
    N mod 2 =:= 0.


solutie(L,E):-
    subm(L,E),
    length(E,N),
    is_even(N).
    


solve(L,RR):-
    findall(R,solutie(L,R),RR).