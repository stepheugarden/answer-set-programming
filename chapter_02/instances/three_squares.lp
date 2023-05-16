% input number n
number(N) :- N=1..n.

% breaking the symmetry by restsricting I2 and I3
threesqr(N) :- N = I1**2 + I2**2 + I3**2, number(N), I1=0..N, I2=0..N, I3=0..N.

% coprime
not_threesqr(N) :- number(N), not threesqr(N).

#show not_threesqr/1.
