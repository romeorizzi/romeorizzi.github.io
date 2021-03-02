enum COLORS;

int: ROWS;
int: COLUMNS;

array[1..ROWS, 1..COLUMNS] of COLORS: GRID;
array[COLORS] of 0..1000: AT_LEAST;
array[COLORS] of 0..1000: AT_MOST;


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

constraint forall(c in COLORS)(
  sum(i in 1..ROWS, j in 1..COLUMNS where GRID[i,j] = c)(path[i,j]) >= AT_LEAST[c] /\
  sum(i in 1..ROWS, j in 1..COLUMNS where GRID[i,j] = c)(path[i,j]) <= AT_MOST[c]
);


solve satisfy;

output[show(path[i,j]) ++ if j mod COLUMNS == 0 then "\n" else " " endif | i in 1..ROWS,j in 1..COLUMNS];