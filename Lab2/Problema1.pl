%1.
%a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers.
%b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, … element in a list.

%a.


cmmdc(A,0,A):-!.
cmmdc(0,B,B):-!.
cmmdc(A,B,R):-
    A>=B,
    A1 is A mod B,
    cmmdc(A1,B,R),!.
cmmdc(A,B,R):-
    A<B,
    B1 is B mod A,
    cmmdc(A,B1,R),!.

cmmmc(A,B,R):-
    cmmdc(A,B,GCD),
    R is A*B/GCD.


%b.
%insert_helper(+L:list, +V:number, +POS:number, +INDEX:number, -R:list)


insert_helper([],_,_,_,[]).
insert_helper([H|T],VALUE,POS,INDEX,[H,VALUE|R]):-
    INDEX =:= POS,
    NEW_POS is POS * 2,
    NEW_INDEX is INDEX + 1,
    insert_helper(T,VALUE,NEW_POS,NEW_INDEX,R).


insert(L,V,R):-
    insert_helper(L,V,1,1,R).



