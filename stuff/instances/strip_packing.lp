
maxheight(14).
maxwidth(7).
rectangle(
    1,4,5;
    2,4,5;
    3,3,3;
    4,2,4;
    5,2,4;
    6,6,1;
).

% placed/3 is a tuple (N,X,Y) where N is the rectangle number and 
% X,Y are the coordinates of the lower left corner of the rectangle
{placed(N,X,Y): X=0..X_Max-1, Y=0..Y_Max-1, maxheight(Y_Max), maxwidth(X_Max)}=1 :- rectangle(N,_,_).

% filled/3: rectangle number and X/Y coordinate
filled(N,XF-1,YF-1) :- placed(N,X,Y), rectangle(N,DX,DY), XF=X+(1..DX), YF=Y+(1..DY).
N1=N2 :- filled(N1,X,Y), filled(N2,X,Y).

highest(H) :- H=#max{Y: filled(_,_,Y)}.
#minimize{H: highest(H)}.

#show highest/1.
#show placed/3.
