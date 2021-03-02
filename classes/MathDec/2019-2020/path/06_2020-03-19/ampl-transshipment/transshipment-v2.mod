# SETS DEFINITION
set NODES; # set of nodes
set ARCS within NODES cross NODES;

# PARAMETERS DEFINITION
param supply{NODES}; # set of supplies associated to each node
param demand{NODES}; # set of demands associated to each node
param arc_capacity{ARCS}, default 80; # maximum amount
param cost{ARCS}; # unit shipping cost for each arc

# VARIABLES DEFINITION
var x{ARCS} >= 0; # for each arc, the amount of product passing through it

# OBJECTIVE FUNCTION
minimize total_cost: sum{(i, j) in ARCS} cost[i,j]*x[i,j];

# CONSTRAINTS DEFINITION
subject to capacity{(i,j) in ARCS}: x[i,j] <= arc_capacity[i,j];
subject to flow_conservation{n in NODES}: supply[n] + sum{(i, n) in ARCS} x[i,n] = sum{(n, j) in ARCS} x[n,j] + demand[n];





