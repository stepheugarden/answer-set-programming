
% horizon
#const h=10.
#const n=10.

brightness(0,off; 1,light; 2,medium; 3,high).

% initial states
init(bulb(I, 3), 0) :- I=1..n.
holds(B,T) :- init(B,T).

% occurs
occurs(pull(I), I-1) :- I=1..h.

% actions
holds(bulb(I, (B+1)\4), T+1) :- holds(bulb(I,B),T), occurs(pull(I),T), T=0..h-1.

% inertia
{holds(B,T+1)} :- holds(B,T), T=0..h-1.

% uniqueness
:- #count{B: holds(bulb(I,B),T)} != 1, T=0..h, I=1..n.

final(Bulb, Brightness) :- holds(bulb(Bulb, I), h), brightness(I, Brightness), Bulb=1..n.

#show final/2.
