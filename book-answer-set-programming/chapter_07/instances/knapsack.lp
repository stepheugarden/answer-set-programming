
#const maxweight=15.
#const maxvolume=21.

n(N) :- N = #count{I: weight(I,_)}.

% select items
{selected(I)} :- weight(I,_).

% weight restriction
total_weight(S) :- S = #sum{W,I: weight(I,W), selected(I)}.
:- S > maxweight, total_weight(S).

% volumne restriction
total_volume(S) :- S = #sum{V,I: volume(I,V), selected(I)}.
:- S > maxvolume, total_volume(S).

% maximize value
#maximize{V,I: value(I,V), selected(I)}.

#show selected/1.
#show total_weight/1.
#show total_volume/1.
