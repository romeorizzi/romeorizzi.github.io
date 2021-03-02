enum Alphabet = {BLACK,A,C,D,E,K,L,T};

array[1..4,1..4] of var 1..card(Alphabet): Puzzle;

array[1..2] of int: AT   = [A,T];
array[1..3] of int: CAT  = [C,A,T];
array[1..3] of int: TEA  = [T,E,A];
array[1..3] of int: TED  = [T,E,D];
array[1..4] of int: LATE = [L,A,T,E];
array[1..4] of int: CAKE = [C,A,K,E];


constraint(
  Puzzle[1,1]=BLACK /\ 
  Puzzle[3,1]=BLACK /\ 
  Puzzle[3,3]=BLACK /\ 
  Puzzle[4,4]=BLACK
);

constraint(
  array1d(Puzzle[1,2..4]) == CAT \/ 
  array1d(Puzzle[1,2..4]) == TEA \/ 
  array1d(Puzzle[1,2..4]) == TED
);
  
constraint(
  array1d(Puzzle[2,1..4]) == LATE \/ 
  array1d(Puzzle[2,1..4]) == CAKE
);

constraint(
  array1d(Puzzle[4,1..3]) == CAT \/ 
  array1d(Puzzle[4,1..3]) == TEA \/ 
  array1d(Puzzle[4,1..3]) == TED
);

constraint(
  array1d(Puzzle[1..4,2]) == LATE \/ 
  array1d(Puzzle[1..4,2]) == CAKE
);

constraint(
  array1d(Puzzle[1..2,3]) == AT
);

constraint(
  array1d(Puzzle[1..3,4]) == CAT \/ 
  array1d(Puzzle[1..3,4]) == TEA \/ 
  array1d(Puzzle[1..3,4]) == TED
);

solve satisfy;

% function fix which checks if a decision variable is fixed and returns its fixed value, and otherwise aborts
output[if fix(Puzzle[i,j])==BLACK then "*" else show(Alphabet[Puzzle[i,j]]) endif ++ if j=4 then "\n" else "" endif | i,j in 1..4];


output[show(index_set(Alphabet))];

