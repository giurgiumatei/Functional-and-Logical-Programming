% a. Determine the product of a number represented as digits in a list to a given digit.
% Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]

%product(L:list,NUMBER:integer,CARRY:integer,R:list)
%product(i,i,o,o).
product([H],NUMBER,CARRY,[DIGIT]):-
    PROD is H * NUMBER,
    CARRY is PROD div 10,
    DIGIT is PROD mod 10.
product([H|T],NUMBER,CARRY,[DIGIT|R]):-
    product(T,NUMBER,C,R),
    PROD is H * NUMBER + C,
    CARRY is PROD div 10,
    DIGIT is PROD mod 10.

%prod(L:list,NUMBER:integer,R:list)
%prod(i,i,o).
prod(LIST,NUMBER,R):-
    product(LIST,NUMBER,CARRY,R),
    CARRY =:=0,!.
prod(LIST,NUMBER,[C|R]):-
    product(LIST,NUMBER,_,R),
    C is 1,!.


% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, write a predicate to replace every sublist with the position
% of the maximum element from that sublist.
% Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, 2, [1, 3], 3, 6, [2], 5, [1,2,3], 7]




%maximum(L:list, M: number, R:number)
%maximum(i,i,o).
maximum([],M,M).
maximum([H|T],M,R):-
    H>M,!,
    maximum(T,H,R).
maximum([_|T],M,R):-
    maximum(T,M,R).

%sublst(L:list,I:integer,Rez:list,Maxi:integer)
%sublst(i,i,o,i).
sublst([],_,[],_):-!.
sublst([H|T],I,Rez,Maxi):-
    %maximum([H|T],0,R),
    H \= Maxi,
    New_I is I+1,
    sublst(T,New_I,Rez,Maxi),!.
sublst([H|T],I,[Pos|Rez],Maxi):-
    %maximum([H|T],0,R),
    H =:= Maxi,
    Pos is I,
    New_I is I+1,
    sublst(T,New_I,Rez,Maxi),!.


%solve_b(L:list,R:list)
%solve_b(i,o).
solve_b([],[]):-!.
solve_b([H|T],[Elem|R]):-
    number(H),
    Elem is H,
    solve_b(T,R),!.
solve_b([H|T],[Elem|R]):-
    maximum(H,0,Maxi),
    sublst(H,1,Rez,Maxi),
    Elem=Rez,
    solve_b(T,R),!.
solve_c(A,B,C):-
    C is A*B.















