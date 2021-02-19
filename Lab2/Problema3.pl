%a.Define a predicate to remove from a list all repetitive elements.
%Example: 1=[1,2,1,4,1,3,4] => l=[2,3]

%count(L:list, E: number, Res: number)
%count(i,i,o).

count([],_,0):-!.
count([H|T],E,Res):-
    H =:= E,
    count(T,E,Res_new),
    Res is Res_new+1, !.
count([H|T],E,Res):-
    H\=E,
    count(T,E,Res).


%remove(L:list, E:number, Res:list)
%remove(i,i,o)
remove([],_,[]):-!.
remove([H|T],E,[H|Res]):-
    H\= E,
    remove(T,E,Res), !.
remove([_|T],E,Res):- remove(T,E,Res).

%solve_a(L:list, Res:list)
%solve_a(i,0)
solve_a([],[]).
solve_a([H|T],[H|Res]):-
    count([H|T],H,Count),
    Count =:=1,!,
    solve_a(T,Res).
solve_a([H|T],Res):-
    count([H|T],H,Count),
    Count \= 1,
    remove([H|T],H,List),
    solve_a(List,Res).

%b. Remove all occurrence of a maximum value from a list on integer numbers.

%max(L:list, M: number, R:number)
%max(i,i,o)
max([],M,M).
max([H|T],M,R):-
    H>M,!,
    max(T,H,R).
max([_|T],M,R):-
    max(T,M,R).

%solve_b(L:list,Res:list)
%solve_b(i,o)
solve_b([H|T],Res):-
    max([H|T],H,Max_value),
    remove([H|T],Max_value,Res).

% c. 2 initial lists, produce a resulted list in which I compute the sum
% of the elements from both lists L1={1,2,3},L2={10,11,12}, Lr={11,13,15}
solve_c([],[],[]).
solve_c([HA|TA],[HB|TB],[HC|TC]):-
        solve_c(TA,TB,TC),
        HC is HA+HB.
