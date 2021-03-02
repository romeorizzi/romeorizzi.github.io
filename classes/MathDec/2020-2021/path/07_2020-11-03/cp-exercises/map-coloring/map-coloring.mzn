enum COLORS;
enum AREAS;
int: BORDERS;

array[1..BORDERS,1..2] of AREAS: ADJACENCY;

array[AREAS] of var COLORS: color;

constraint forall(i in 1..BORDERS)(color[ADJACENCY[i,1]] != color[ADJACENCY[i,2]]);

solve satisfy;

output[show(a) ++ " = " ++ show(color[a]) ++ "\n" | a in AREAS];