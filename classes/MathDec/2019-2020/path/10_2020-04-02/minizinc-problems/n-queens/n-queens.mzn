int: N;
array [1..N] of var 1..N: q; % queen in column i is in row q[i]

include "alldifferent.mzn";

constraint alldifferent(q);                       % distinct rows
constraint alldifferent([ q[i] + i | i in 1..N]); % distinct diagonals
constraint alldifferent([ q[i] - i | i in 1..N]); % distinct diagonals

solve satisfy;
output [show(q)];