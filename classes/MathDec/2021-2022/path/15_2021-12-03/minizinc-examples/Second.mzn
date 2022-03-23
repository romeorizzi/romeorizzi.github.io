enum Nodes;
array[Nodes] of set of Nodes: Adj;

enum Colors;
% mapping coloring: Nodes -> Colors

array[Nodes] of var Colors: coloring;

% Ajd[x1] = {x2,x3}

constraint forall(u in Nodes, v in Adj[u])(coloring[u] != coloring[v]);


solve satisfy;

output[show(n) ++ " = " ++ show(coloring[n]) ++ "\n" | n in Nodes]; 

