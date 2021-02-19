


%remove elements from position n,2*n,4*n....

solve([],_,_,[]).
solve([_|T],N1,N2,R):-
    N1 =:= N2,
    N1New is N1 + 1,
    N2New is N2*2,
    solve(T,N1New,N2New,R),!.


solve([H|T],N1,N2,[H|R]):-
  %  N1 =\= N2,
    N1New is N1 + 1,
    solve(T,N1New,N2,R).

solve_main(L,N,R):-
    solve(L,1,N,R).
