
n(N) :- N = #count{L: s(_,L)}.
elements(X) :- s(X, _).
sets(S) :- s(_, S).

% choose subcollection
1 {chosen(S): sets(S)} N :- n(N).

% chosen sets have to be disjoint
X1 != X2 :- S1 != S2, chosen(S1), chosen(S2), s(X1, S1), s(X2, S2).

% has to cover all elements
covered(X) :- s(X, S), chosen(S).
:- elements(X), not covered(X).

#show chosen/1.
