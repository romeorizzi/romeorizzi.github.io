int: N = 3;

var 1..N: x1;
var 1..N: x2;
var 1..N: x3;
var 1..N: x4;
var 1..N: x5;
var 1..N: x6;
var 1..N: x7;
var 1..N: x8;

constraint x1 != x2;
constraint x1 != x3;
constraint x2 != x3;
constraint x2 != x4;
constraint x3 != x4;
constraint x3 != x5;
constraint x3 != x6;
constraint x3 != x7;
constraint x4 != x7;
constraint x5 != x6;
constraint x5 != x8;
constraint x6 != x7;
constraint x6 != x8;

solve satisfy;







  


