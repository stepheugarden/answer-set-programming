
block(1..9).
init(
    loc(1,2); loc(2,3); loc(3,4); loc(4,table);
    loc(5,6); loc(6,7); loc(7,table);
    loc(8,9); loc(9,table)
).

final(
    loc(9,6); loc(6,3); loc(3,table)
).

#const horizon=10.
