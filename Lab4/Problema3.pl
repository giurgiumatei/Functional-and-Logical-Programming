% 3. Write a predicate to determine all decomposition of n (n given, positive),
% as sum of consecutive natural numbers.

sublists([],[]).
sublists([H|T],[H|R]):-
    sublists(T,R).
sublists([_|T],R):-
    sublists(T,R).

consecutive([_]):-!.
consecutive([H1,H2|T]):-
    DIFF is H2 - H1,
    DIFF =:= 1,
    consecutive([H2|T]).

sum([],0).
sum([H|T], SUM):-
    sum(T,AUX),
    SUM is H + AUX.

range_(0,[]):-!.
range_(N,R):-
    M is N-1,
    range_(M,AUX),
    append(AUX,[N],R).

range(N,R):-
    M is N-1,
    range_(M,R).

one_solution(N,R):-
    range(N,RANGE),
    sublists(RANGE,R),
    consecutive(R),
    sum(R,N).

all_solutions(N,R):-
    findall(AUX,one_solution(N,AUX),R).
