include "alldifferent.mzn";

int: N = 4;

var 1..N: A;
var 1..N: B;
var 1..N: C;
var 1..N: D;

constraint B = 1 \/ B = 4;
constraint D = 3 \/ D = 4;
constraint alldifferent([A,B,C,D]);
constraint B < A;
constraint A < D;
constraint C > B;

solve satisfy;

