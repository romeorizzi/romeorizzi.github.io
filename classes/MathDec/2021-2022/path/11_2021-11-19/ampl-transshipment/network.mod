set NODES;
set ARCS within NODES cross NODES; # (i,j)

param capacity{ARCS};
param cost{ARCS};
param supply{NODES};
param demand{NODES};

var x{ARCS} >= 0;

minimize total_cost: sum{(i,j) in ARCS} x[i,j]*cost[i,j];
subject to maximum_quantity{(i,j) in ARCS}: x[i,j] <= capacity[i,j];
subject to flow_conservation{j in NODES}: sum{(i,j) in ARCS} x[i,j] - sum{(j,k) in ARCS} x[j,k] = demand[j] - supply[j];