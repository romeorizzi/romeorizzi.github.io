% Sudoku

array[1..9,1..9] of 0..9: data;

array[1..9,1..9] of var 1..9: puzzle;


include "alldifferent.mzn";


constraint(
  forall(i,j in 1..9)(
    if data[i,j] != 0 then puzzle[i,j]=data[i,j] else true endif
  )
);


constraint(
  forall(i in 1..9)(alldifferent(puzzle[i,1..9]))
);

constraint(
  forall(j in 1..9)(alldifferent(puzzle[1..9,j]))
);

constraint(
  forall(i in 0..2,j in 0..2)(
    alldifferent(puzzle[3*i+1..3*i+1+2,3*j+1..3*j+1+2]))
);


solve satisfy;

output[show(puzzle[i,j]) ++ if j mod 3 == 0 then " " else "" endif 
                         ++ if j == 9 then if i mod 3 == 0 then "\n\n" else "\n" endif else " " endif | i,j in 1..9];