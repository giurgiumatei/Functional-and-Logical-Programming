%a. Write a predicate to determine if a list has even numbers of elements without counting the elements from
%the list.
%b. Write a predicate to delete first occurrence of the minimum number from a list.


%a

even([]).
even([_,_|T]):-
    even(T).

%b

min([MIN],MIN).
min([H|T],H):-
    min(T,MIN),
    H < MIN,!.
min([_|T],MIN):-
    min(T,MIN).


delete_first([],_,[]).
delete_first([H|T],K,T):-
    H =:= K,!.
delete_first([H|T],K,[H,R]):-
    delete_first(T,K,R).

delete_min(L,R):-
    min(L,MIN),
    delete_first(L,MIN,R),!.
