%a. Define a predicate to test if a list of an integer elements has a
% "valley" aspect (a set has a "valley" aspect if elements decreases up
% to a certain point, and then increases. eg: 10 8 6 9 11 13 � has a
% �valley� aspect b. Calculate the alternate sum of list�s elements (l1 -
% l2 + l3 ...)

%a


valley_parse([_],1,N):-
    N > 0.
valley_parse([H1,H2|T],_,N):-
    H1 < H2,
    valley_parse([H2|T],1,N),!.
valley_parse([H1,H2|T],0,N):-
    H1 > H2,
    N1 is N+1,
    valley_parse([H2|T],0,N1),!.

%b

alternate_sum([],0):-!.
alternate_sum([H],H):-!.
alternate_sum([H1,H2|T],R):-
    alternate_sum(T,H),
    R is H1 - H2 + H.
