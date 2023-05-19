
field(1..4, 1..4). % it takes a longer time if you chose more fields

fields(F) :- F = #count{X,Y: field(X,Y)}.
0 < {placed(X,Y): field(X,Y)} <= F :- fields(F).
n_placed(N) :- N = #count{X,Y: placed(X,Y)}.

|X1-X2| != |Y1-Y2| :- placed(X1, Y1), placed(X2, Y2), X1 != X2.
|X1-X2| != |Y1-Y2| :- placed(X1, Y1), placed(X2, Y2), Y1 != Y2.


#maximize{N: n_placed(N)}.


#show n_placed/1.
#show placed/2.
