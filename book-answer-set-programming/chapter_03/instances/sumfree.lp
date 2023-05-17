
%input integer n and k as described above

% assign each number to one of k sets
{a(N, S): S=1..k} = 1:- N=1..n.

% each set S has to be sum-free
:- a(N_sum, S), a(N1, S), a(N2, S), N_sum = N1+N2.

#show a/2.
