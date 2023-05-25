
% horizon: we have three actions to execute
#const h=2.

% initial states
opposite(left, right; right, left).
init(loc(boat, left); loc(a, left); loc(b, right)).
holds(I,0) :- init(I).

% actions executed
occurs(cross,0; transport,1).

% cross
holds(loc(boat, S), T+1) :- occurs(cross,T), holds(loc(boat, S_t), T), opposite(S_t,S), T=0..h-1.
%:- #count{S: holds(loc(boat, S), T)} != 1, T=0..h.

% transport: moving item and boat. Item and boat have to be on same side!
holds(loc(boat, S), T+1) :- occurs(transport,T), holds(loc(boat, S_t), T), opposite(S_t,S), T=0..h-1.
holds(loc(I,S), T+1) :- occurs(transport, T), holds(loc(I, S_t), T), holds(loc(boat, S_t), T), opposite(S_t,S), T=0..h-1.

:- #count{S: holds(loc(I, S), T)} != 1, T=0..h, init(loc(I,_)).

% inertia
{holds(L, T+1)} :- holds(L,T), T=0..h-1.

final(L) :- holds(L,h).

#show final/1.
%#show holds/2.
