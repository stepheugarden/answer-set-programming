% ann is parent of bob and bob has children carol and dan
parent(ann, bob; bob, carol; bob, dan).

% ancestors are recursive
ancestor(X,Y) :- parent(X,Y).
ancestor(Z,Y) :- ancestor(X,Y), ancestor(Z,X).

% show all ancestors
#show ancestor/2.
