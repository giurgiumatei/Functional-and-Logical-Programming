
elem([E|_],E).
elem([_|T],E):-elem(T,E).

sterge([E|R],E,R):-!.
sterge([H|T],E,[H|R]):-sterge(T,E,R).


perm([],[]).
perm(L,[E|RR]):-elem(L,E),sterge(L,E,R),perm(R,RR).

subm([],[]).
subm([H|T],[H|R]):-subm(T,R).
subm([_|T],R):-subm(T,R).

comb([],0,[]).
comb([H|T],K,[H|R]):-K1 is K-1,comb(T,K1,R).
comb([_|T],K,R):-comb(T,K,R).

aranj(L,K,RR):-comb(L,K,R),perm(R,RR).

produc([],1).
produc([H|T],R):-produc(T,R1),R is R1*H.

%asa nu
produc1([],R):-R.
produc1([H,T],R):-R1 is R*H,produc1(T,R1).


keep([],_,[]).
keep([H|T],P,[H|R]):-produc(H,P),keep(T,P,R),!.
keep([_|T],P,R):-keep(T,P,R).

solve(L,K,P,RR):-findall(AUX,aranj(L,K,AUX),R),keep(R,P,RR).
p(1).
p(2).
q(1).
q(2).
r(1).
r(2).
s:p(X),q(Y),r(Z),!,write(X),write(Y),write(Z),nl.
