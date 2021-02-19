%a. Write a predicate to compute the union of two sets.
%b. Write a predicate to determine the set of all the pairs of elements in a list.
%Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c d]].


%a

remove_occurences([],_,[]).
remove_occurences([H|T],VALUE,[H|R]):-
    H =\= VALUE,
    remove_occurences(T,VALUE,R).
remove_occurences([H|T],VALUE,R):-
    H =:= VALUE,
    remove_occurences(T,VALUE,R).

my_union([],[],[]).
my_union([H|T],SET2,[H|R]):-
    remove_occurences(T,H,R1),
    remove_occurences(SET2,H,R2),
    my_union(R1,R2,R).
my_union([],SET2,R):-
    my_union(SET2,[],R).

%b
generate_sets(_,0,[]):-!.
generate_sets([H|T],K,[H|R]):-
    K1 is K - 1,
    generate_sets(T,K1,R).
generate_sets([_|T],K,R):-
    generate_sets(T,K,R).

sets([],[]).
sets(LIST,R):-
    findall(X,generate_sets(LIST,2,X),R).
