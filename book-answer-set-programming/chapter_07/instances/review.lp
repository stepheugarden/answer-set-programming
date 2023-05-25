
#const min_reviewer = 2.

% assign papers
{assigned(P,E): expert(E)} >= min_reviewer :- paper(P).

% no assignment if expert said no
:- assigned(P,E), bid(E,P,no).

% workload balanced
work(E,N) :- N = #count{P: assigned(P,E)}, expert(E).
:- work(E1,N1), work(E2,N2), E1 != E2, |N1-N2|>1.

% maximize yes
#maximize{1,P,E: assigned(P,E), bid(E,P,yes)}.

#show assigned/2.
