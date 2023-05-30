
% inital state
holds(L,T) :- init(L), T=0.

% actions
action(move((XF,YF), (XT,YT))) :- coord((XF,YF)), coord((XT,YT)), |XF-XT|+|YF-YT|=1.
action(wait).

% apply actions
{occurs(A, T): action(A)} = 1 :- T=1..horizon-1.

% moves only to adjecent fields
:- occurs(move((X1,Y1), (X2,Y2)), T), |X1-X2|+|Y1-Y2|!=1.

% moves only on to blank field
:- occurs(move((X1,Y1), (X2,Y2)), T), holds(loc(X2,Y2,P2),T), P2!=blank.

% update and inertia
holds(loc(X_to,Y_to,N_from), T+1) :- occurs(move((X_from, Y_from), (X_to, Y_to)), T), holds(loc(X_from, Y_from, N_from), T).
holds(loc(X_from,Y_from, blank), T+1) :- occurs(move((X_from, Y_from), (X_to, Y_to)), T).
{holds(L,T+1)} :- holds(L,T), T=0..horizon-1.
:- #count{X,Y : holds(loc(X,Y,N),T)} != 1, T=0..horizon, elements(N).

#maximize{T: occurs(wait,T)}.

N1=N2 :- holds(loc(X,Y,N1),horizon), final(loc(X,Y,N2)).

#show occurs/2.
