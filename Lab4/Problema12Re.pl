

is_valid([]):-!.
is_valid([H]):-H =:= 0,!.
is_valid([H1,H2|T]):-
    H1 =\= H2,!,
    is_valid([H2|T]).

get_element(0,_,Rez):-
    is_valid(Rez).

get_element(N,R1,[H2|R2]):-
    N1 is N-1,
    R1 =:= 1,
    H2 is 0,
    get_element(N1,H2,R2),!.

get_element(N,R1,[H2|R2]):-
    N1 is N-1,
    R1 =:= 1,
    H2 is -1,
    get_element(N1,H2,R2),!.

get_element(N,R1,[H2|R2]):-
    N1 is N-1,
    R1 =:= 0,
    H2 is 1,
    get_element(N1,H2,R2),!.

get_element(N,R1,[H2|R2]):-
    N1 is N-1,
    R1 =:= 0,
    H2 is -1,
    get_element(N1,H2,R2),!.

get_element(N,R1,[H2|R2]):-
    N1 is N-1,
    R1 =:= -1,
    H2 is 0,
    get_element(N1,H2,R2),!.

get_element(N,R1,[H2|R2]):-
    N1 is N-1,
    R1 =:= -1,
    H2 is 1,
    get_element(N1,H2,R2),!.


generate_all_substrings(0,[]):-!.
generate_all_substrings(N,Rez):-
    K is 2*N,
    K1 is K + 1,
    findall(Rpartial,get_element(K1,0,Rpartial),Rez).


