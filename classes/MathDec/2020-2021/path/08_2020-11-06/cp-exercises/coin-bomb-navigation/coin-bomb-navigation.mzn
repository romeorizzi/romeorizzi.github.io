int: ROWS;
int: COLUMNS;
array[1..ROWS, 1..COLUMNS] of float: GRID;
int: N;
array[1..N,1..2] of int: BOMBS;

array[1..ROWS, 1..COLUMNS] of var 0..1: path;

constraint path[1,1] = 1;
constraint path[ROWS,COLUMNS] = 1;

constraint forall(i in 1..ROWS-1, j in 1..COLUMNS-1)(
  if path[i,j] = 1 then (path[i+1,j] + path[i,j+1]) = 1
  
  else true endif
);

constraint forall(j in 1..COLUMNS-1)(
  if path[ROWS,j] = 1 then path[ROWS,j+1]= 1  
  else true endif
);

constraint forall(i in 1..ROWS-1)(
  if path[i,COLUMNS] = 1 then path[i+1,COLUMNS] = 1  
  else true endif
);  


constraint sum(i in 1..ROWS, j in 1..COLUMNS)(path[i,j]) = ROWS + COLUMNS - 1;

constraint forall(i in 1..N)(path[BOMBS[i,1],BOMBS[i,2]] = 0);

solve maximize sum(i in 1..ROWS, j in 1..COLUMNS)(path[i,j]*GRID[i,j]);

output[show(path[i,j]) ++ if j mod COLUMNS == 0 then "\n" else " " endif | i in 1..ROWS,j in 1..COLUMNS];