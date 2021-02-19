%12. Generate all sub-strings of a length 2*n+1,
% formed from values of 0, 1 or -1, so a1 = ..., a2n+1 = 0
%and |a(i+1) - ai| = 1 or 2, for every 1 <= i <= 2n.


% if_exists(E,L)- function that checks if the Element E is in the list
% in our case because of the (o,i) flow model it bounds to E an element
% of the list
%(i,i),(o,i)
if_exists(E,[E|_]).
if_exists(E,[_|T]):-
    if_exists(E,T).


%get_element(N,L)- function that builds the substring of -1,0 and 1's
%of length 2n+1
% (i,o)

get_element(0,[]):-!.
get_element(N,[H|Rez]):-
    N1 is N-1,
    if_exists(H,[-1,0,1]),
    get_element(N1,Rez),
    is_valid(Rez).



% is_valid(L)- function that checks if all the list is valid.
% A list is invalid if there are two consecutive elements are identical,
% or if the last element is not 0
%(i)
is_valid([]):-!.
is_valid([H]):-H =:= 0,!.
is_valid([H1,H2|T]):-
    H1 =\= H2,!,
    is_valid([H2|T]).

% generate_all_substrings(N,Rez)- function that generates every valid
% 2N + 1 elements sub-string
% (i,o)
generate_all_substrings(0,[]):-!.
generate_all_substrings(N,Rez):-
    K is 2*N,
    K1 is K + 1,
    findall(Rpartial,get_element(K1,Rpartial),Rez).

