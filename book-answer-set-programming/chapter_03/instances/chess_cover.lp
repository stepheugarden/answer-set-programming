
% horizontal tiles h(R,C): tile starts in row R at position C through C+2
% similar tiles v(R,C)

% chose 21 v's and h's in total
{v(1..6, 1..8); h(1..8, 1..6)} = 21.

% no overlap within h and v
C1=C2 :- h(R,C1), h(R, C2), |C1-C2|<3.
R1=R2 :- v(R1,C), v(R2, C), |R2-R1|<3.

% no overlap between v and h
v_covered(R+(0..2), C) :- v(R,C).
h_covered(R, C+(0..2)) :- h(R,C).
:- h_covered(R, C), v_covered(R,C).
#show h/2.
#show v/2.
