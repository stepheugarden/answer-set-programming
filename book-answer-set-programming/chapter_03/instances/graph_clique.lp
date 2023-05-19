#const n=3.

% make graph undirected
edge(B,A) :- edge(A, B).

% chose a set of size n
{selected(V): vertex(V)} = n.

:- selected(V1), selected(V2), not edge(V1, V2), V1 != V2.

#show selected/1.
