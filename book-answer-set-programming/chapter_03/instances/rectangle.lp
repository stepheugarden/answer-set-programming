
#const lx=8.
#const ly=5.

grid(1..lx, 1..ly).
size(
    a,4;
    b,3;
    c,2;
    d,2;
    e,1
).

% bottom left corner
{corner(X,Y,L): grid(X,Y)} = 1 :- size(L,_).

Y+S-1 <= ly :- corner(_,Y,L), size(L,S).
X+S-1 <= lx :- corner(X,_,L), size(L,S).

% no overlap
filled(X + (1..S), Y + (1..S),L) :- corner(X,Y,L), size(L,S).
L1 = L2 :- filled(X,Y,L1), filled(X,Y,L2). 

#show corner/3.
