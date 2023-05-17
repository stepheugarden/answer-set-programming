% input n = the number of colours to try to colour the graph (defaults to 3)
#const n=3.

% make graph undirected. If you comment out this line then the program works for directed graphs
edge(B,A) :- edge(A, B).

% assign colours: colour(Vertex, Colour)
{colour(V, C): C = 1..n} = 1 :- vertex(V).

C1 != C2 :- edge(X1, X2), colour(X1,C1), colour(X2,C2).

#show colour/2.
