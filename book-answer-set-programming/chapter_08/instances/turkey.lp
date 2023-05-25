
% horizon: we have three actions to execute
#const h=3.

% initial states
init(state_of_gun(unloaded); state_of_turkey(alive)).
holds(I,0) :- init(I).

% actions executed
occurs(load,0; shoot,1; load,2).

% load: you can only load if gun is not already loaded
holds(state_of_gun(loaded), T+1) :- occurs(load, T).
:- holds(state_of_gun(loaded), T), occurs(load, T).

% shoot: you cannot shoot if gun is unloaded
holds(state_of_turkey(dead), T+1) :- occurs(shoot, T).
holds(state_of_gun(unloaded), T+1) :- occurs(shoot, T).
:- holds(state_of_gun(unloaded), T), occurs(shoot, T).

% inertia: states are carried on if no action is executed
{holds(state_of_turkey(Turkey), T+1)} :- holds(state_of_turkey(Turkey), T), T=0..h-1.
{holds(state_of_gun(Gun), T+1)} :- holds(state_of_gun(Gun), T), T=0..h-1.

% uniqueness
:- #count{S: holds(state_of_gun(S),T)} != 1, T=0..h.
:- #count{S: holds(state_of_turkey(S),T)} != 1, T=0..h.

final(H) :- holds(H,h).

#show final/1.
