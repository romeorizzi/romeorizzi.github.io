enum COLORS;
int: K;
enum NODES;

int: NUMBER_OF_EDGES;

array[1..NUMBER_OF_EDGES, 1..2] of NODES: EDGES;

array[NODES] of var COLORS: color;
          
constraint forall(i in 1..NUMBER_OF_EDGES)(color[EDGES[i,1]] != color[EDGES[i,2]]);

/* constraint card({color[n] | n in NODES}) <= K; */
          
solve minimize card({color[n] | n in NODES});
          
/* solve satisfy; */

output[show(n) ++ " = " ++ show(color[n]) ++ "\n" | n in NODES];