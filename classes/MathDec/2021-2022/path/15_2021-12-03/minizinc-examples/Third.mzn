enum Nodes;
array[Nodes] of set of Nodes: Adj;

enum Colors;
% mapping coloring: Nodes -> Colors

array[Nodes] of var Colors: coloring;

% Ajd[x1] = {x2,x3}

constraint forall(u in Nodes, v in Adj[u])(coloring[u] != coloring[v]);

output["Number of used colors is = " ++ show(card({coloring[n] | n in Nodes})) ++ "\n"];

solve minimize card({coloring[n] | n in Nodes});

output[show(n) ++ " = " ++ show(coloring[n]) ++ "\n" | n in Nodes]; 

