
%initial state at T=0
holds(L,T) :- init(L), T=0.

% all potential moves (legal and illegal)
action(move(B1,B2)) :- block(B1), block(B2), B1!=B2.
action(move(B,table)) :- block(B).
{occurs(A,T): action(A)} = 1 :- T=0..(horizon-1).

% apply actions
holds(loc(B,L),T+1) :- occurs(move(B,L), T).

% only one block can be on top of an other
Top1=Top2 :- holds(loc(Top1, Bottom), T), holds(loc(Top2, Bottom), T), block(Bottom).

% you can only move unblocked blocks
:- occurs(move(B,L),T), holds(loc(_,B),T).

% cannot move to same location
:- occurs(move(B,L),T), holds(loc(B,L),T).

% block can only be at one place
:- #count{L : holds(loc(B,L),T)} != 1, block(B), T=0..horizon.

% inertia: blocks stay where they are when not moved
{holds(loc(B,L),T+1)} :- holds(loc(B,L),T), T=0..horizon-1.

% find minimum number of actions
satisfied(F,T) :- holds(F,T), final(F).
nb_sat(C1,T) :- C1=#count{F: satisfied(F,T)}, T=0..horizon.
nb_fin(C2) :- C2=#count{F: final(F)}.
solved(T) :- nb_sat(C1,T), nb_fin(C2), C1=C2.
:- not solved(_).

#minimize{T: solved(T)}.

% print strategy
strategy(A,T) :- occurs(A,T), T<T_solved, solved(T_solved).
#show strategy/2.
