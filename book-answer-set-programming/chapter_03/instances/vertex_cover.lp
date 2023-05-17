% input n = the number of vertices to choose as a cover (defaults to 3)
#const n=3.

% make graph undirected. If you comment out this line then the program works for directed graphs
edge(B,A) :- edge(A, B).

% select cover
{selected(V): vertex(V)} = n.

% ensure that everything is connected to the cover
covered(A) :- edge(A, V), selected(V).
covered(V) :- selected(V).

:- edge(A,_), not covered(A).

#show selected/1.
