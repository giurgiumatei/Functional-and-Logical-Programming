%a. Write a predicate to remove all occurrences of a certain atom from a list.
%b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms.
%In this initial list atom has n occurrences.
%Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].


%a

remove_occurences([],_,[]).
remove_occurences([H|T],VALUE,[H|R]):-
    H =\= VALUE,
    remove_occurences(T,VALUE,R).
remove_occurences([H|T],VALUE,R):-
    H =:= VALUE,
    remove_occurences(T,VALUE,R).


%b

count_occurences([],_,0).
count_occurences([H|T],VALUE,COUNT):-
    H =:= VALUE,
    count_occurences(T,VALUE,CNT),
    COUNT is CNT + 1.
count_occurences([H|T],VALUE,COUNT):-
    H =\= VALUE,
    count_occurences(T,VALUE,COUNT).


main([],[]).
main([H|T],[[H|OCCURENCES] |R]):-
     count_occurences([H|T],H,OCCURENCES),
     remove_occurences(T,H,REM),
     main(REM,R).
