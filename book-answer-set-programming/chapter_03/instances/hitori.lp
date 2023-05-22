
#const columns=8.
#const rows=8.

% check input
:- not field(R,C,_), R=1..rows, C=1..columns.

% blacken fields rows and columns
{blackened(R, C): C=1..columns} <= columns/2 :- R=1..rows.
{blackened(R, C): R=1..rows} <= rows/2 :- C=1..columns.

% blackened are not adjecent
:- blackened(R,C), blackened(R-1, C), R=2..rows, C=1..columns.
:- blackened(R,C), blackened(R, C-1), R=1..rows, C=2..columns.

viewable(R,C,N) :- field(R,C,N), not blackened(R,C).

% viewable numbers are unique within row/column
:- viewable(R,C1,N), viewable(R,C2,N), C1!=C2, R=1..rows.
:- viewable(R1,C,N), viewable(R2,C,N), R1!=R2, C=1..columns.

% every viewable number must have a viewable number adjecent
:- viewable(R,C,_), blackened(R-1,C), blackened(R+1,C), blackened(R,C-1), blackened(R,C+1). %31038

:- viewable(R,C,_), blackened(R+1,C), blackened(R,C-1), blackened(R,C+1), R=1.
:- viewable(R,C,_), blackened(R-1,C), blackened(R,C-1), blackened(R,C+1), R=8.

:- viewable(R,C,_), blackened(R-1,C), blackened(R+1,C), blackened(R,C+1), C=1.
:- viewable(R,C,_), blackened(R-1,C), blackened(R+1,C), blackened(R,C-1), C=8.

%#minimize{1,R,C: blackened(R,C)}.
 
#show blackened/2.
