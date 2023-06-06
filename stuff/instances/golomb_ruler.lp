
% Golomb ruler with n marks to be set. n defaults to 6
#const n=6.
{mark(N): N=0..20} = n.

% one difference has to be 10
difference(D) :- D = N1-N2, N1>N2, mark(N1), mark(N2).
number_differences(N) :- N=#count{D: difference(D)}.
:- not difference(10).

% unique differences
:- number_differences(N), N != n*(n-1)/2.

max_mark(M) :- M=#max{N: mark(N)}.
#minimize{M: max_mark(M)}.

#show mark/1.
