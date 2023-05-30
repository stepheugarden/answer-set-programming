
coord((1..4, 1..4)).
elements(1..15).
elements(blank).
init(
    loc(1,1,3); loc(1,2,6); loc(1,3,9); loc(1,4,12);
    loc(2,1,4); loc(2,2,13); loc(2,3,10); loc(2,4,7);
    loc(3,1,blank); loc(3,2,5); loc(3,3,8); loc(3,4,14);
    loc(4,1,15); loc(4,2,1); loc(4,3,11); loc(4,4,2);
).

final(
    loc(1,1,1); loc(1,2,2); loc(1,3,3); loc(1,4,4);
    loc(2,1,5); loc(2,2,6); loc(2,3,7); loc(2,4,8);
    loc(3,1,9); loc(3,2,10); loc(3,3,11); loc(3,4,12);
    loc(4,1,13); loc(4,2,14); loc(4,3,15); loc(4,4,blank);
).

#const horizon=60.
