int: N;
array[1..N, 1..3] of 1..9: PREFILLED_CELLS;

include "alldifferent.mzn";

array[1..9,1..9] of var 1..9: solution;

constraint forall(i in 1..N)(solution[PREFILLED_CELLS[i,1], PREFILLED_CELLS[i,2]] = PREFILLED_CELLS[i,3]);  

constraint forall(i in 1..9)(all_different(solution[i,1..9]));
constraint forall(j in 1..9)(all_different(solution[1..9,j]));

constraint forall(i in 0..2, j in 0..2)(all_different(solution[3*i+1..3*i+3,3*j+1..3*j+3]));

solve satisfy;

output[show(solution[i,j]) ++ if j mod 3 == 0 then " " else "" endif 
                           ++ if j == 9 then if i mod 3 == 0 then "\n\n" else "\n" endif else " " endif | i,j in 1..9];