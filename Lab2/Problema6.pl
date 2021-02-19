%a. Write a predicate to test if a list is a set.
% b. Write a predicate to remove the first three occurrences of an
% element in a list. If the element occurs less than three times, all
% occurrences will be removed.

%a

count_occurences([],_,0).
count_occurences([H|T],VALUE,COUNT):-
    H =:= VALUE,
    count_occurences(T,VALUE,CNT),
    COUNT is CNT + 1.
count_occurences([H|T],VALUE,COUNT):-
    H =\= VALUE,
    count_occurences(T,VALUE,COUNT).

is_set([]).
is_set([H|T]):-
    count_occurences(T,H,0),
    is_set(T).

%b


remove_k_occurences([],_,_,[]):-!.
remove_k_occurences([V|T],V,K,R):-
    K > 0,
    K1 is K - 1,
    remove_k_occurences(T,V,K1,R),!.
remove_k_occurences([H|T],V,K,[H|R]):-
    remove_k_occurences(T,V,K,R).

remove_3_occurences(L,V,R):-
    remove_k_occurences(L,V,3,R). %al treilea parametru ii nr de aparitii
