% Use this editor as a MiniZinc scratch book


% red = 1
% blue = 2
% green = 3

var 1..3: x1;
var 1..3: x2;
var 1..3: x3;
var 1..3: x4;
var 1..3: x5;
var 1..3: x6;
var 1..3: x7;
var 1..3: x8;

constraint x1 != x2;
constraint x1 != x3;
constraint x2 != x3;
constraint x2 != x4;
constraint x3 != x4;
constraint x3 != x7;
constraint x3 != x6;
constraint x3 != x5;
constraint x4 != x7;
constraint x5 != x6;
constraint x5 != x8;
constraint x6 != x7;
constraint x6 != x8;

solve satisfy; 


