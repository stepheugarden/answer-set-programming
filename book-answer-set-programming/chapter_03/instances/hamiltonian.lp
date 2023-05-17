
n(N) :- N = #count{V: vertex(V)}.

% assign an ordering to every node
{order(V,O): O=1..N, n(N)} = 1 :- vertex(V).
V1 = V2 :- order(V1, O), order(V2, O).

% check that there is actually a path between the vertex orders
:- order(V1, O1), order(V2, O2), O2 = O1+1, not edge(V1, V2).
:- order(V1, O1), order(V2, O2), n(O2), O2 = O1+1, not edge(V1, V2).

#show order/2.
