
field(
    2, 5, a; 
    3, 3, b; 
    4, 1, d; 
    4, 3, c; 
    5, 4, e
).
letters(a; b; c; d; e).

{field(X, Y, L) : letters(L)} = 1 :- X=1..5, Y=1..5.

L1 = L2 :- field(X,Y,L1), field(X,Y,L2).

N = 5 :- N = #count{L: field(X,_,L)}, X=1..5.
N = 5 :- N = #count{L: field(_,Y,L)}, Y=1..5.
N = 5 :- N = #count{L: field(X, X, L), X=1..5}.
N = 5 :- N = #count{L: field(X,6-X,L), X = 1..5}.

question_mark(L) :- field(1,2,L).
#show question_mark/1.
