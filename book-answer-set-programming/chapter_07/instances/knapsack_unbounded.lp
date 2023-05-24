
#const maxweight=15.
#const maxvolume=21.

n(I, maxweight/W) :- weight(I,W).

% select items
{selected(I,N)} <= N:- weight(I,_), n(I,N).

%% weight restriction
total_weight(S) :- S = #sum{N*W,I: weight(I,W), selected(I,N)}.
:- S > maxweight, total_weight(S).

% volumne restriction
total_volume(S) :- S = #sum{N*V,I: volume(I,V), selected(I,N)}.
:- S > maxvolume, total_volume(S).

% maximize value
#maximize{N*V,I: value(I,V), selected(I,N)}.

#show selected/2.
#show total_weight/1.
#show total_volume/1.
#show n/2.
