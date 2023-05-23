% default size n=3
#const n=3.
#const result=(n+n**3)/2.

{number(X,Y,N) : N=1..n*n} = 1 :- X=1..n, Y=1..n.

% each number 1..n**2 is observed
:- not number(_,_,N), N=1..n*n.

% each row/column sum up to (n+n**3)/2
:- #sum{N: number(X,_,N)} != result, X=1..n.
:- #sum{N: number(_,Y,N)} != result, Y=1..n.

% diagonals
:- #sum{N: number(X,X,N), X=1..n} != result.
:- #sum{N: number(X,n-X+1,N), X=1..n} != result.
