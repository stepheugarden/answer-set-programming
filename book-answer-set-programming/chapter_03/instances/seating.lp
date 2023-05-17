#const n=5.
#const m=4.

like(1,2; 2,4; 4,8; 12,13).
dislike(2,3; 3,4; 5,6; 7,8; 9,10; 11,12; 14,15).

% seated(G,T): guest G is seated at table T
% place m guests at each table
{seated(1..m*n, T)} = m :- T=1..n.

% each guest has to sit only at one table
T1 = T2 :- seated(G, T1), seated(G, T2), G=1..m*n.

% each table has disjoint guests
%G1 = G2 :- seated(G1, T), seated(G2, T), T = 1..n.

% like and dislike conditions
:- seated(G1, T), seated(G2, T), dislike(G1, G2).
T1 = T2 :- seated(G1, T1), seated(G2, T2), like(G1, G2). %, T = 1..n.

#show seated/2.
