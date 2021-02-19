%a. Insert an element on the position n in a list.
%b. Define a predicate to determine the greatest common divisor of all numbers from a list.


%a

insert(L,E,0,[E|L]):-!.
insert([H|T],E,POS,[H|R]):-
    POS1 is POS - 1,
    insert(T,E,POS1,R).

%b

cmmdc(A,0,A):-!.
cmmdc(0,B,B):-!.
cmmdc(A,B,R):-
    A >= B,
    A1 is A mod B,
    cmmdc(A1,B,R),!.
cmmdc(A,B,R):-
    A < B,
    B1 is B mod A,
    cmmdc(A,B1,R).

cmmdc_lista([H],H) :-!.
cmmdc_lista([H1,H2|T],R):-
    cmmdc(H1,H2,CMMDC),
    cmmdc_lista([CMMDC|T],R).
