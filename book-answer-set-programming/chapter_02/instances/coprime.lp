% input number n and number k
number(N) :- N=1..n.

% number N is noncomprime iff there is a number D>1 that divides N and k 
noncoprime(N) :- number(N), N\D=0, k\D=0, D=2..N.

% coprime
coprime(N) :- number(N), not noncoprime(N).

#show coprime/1.
