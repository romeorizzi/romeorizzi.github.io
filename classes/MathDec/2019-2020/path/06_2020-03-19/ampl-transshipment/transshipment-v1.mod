# SETS DEFINITION
set A; # set of arcs
set S; # set of supplies
set D; # set of demands

# PARAMETERS DEFINITION
param supply{S};
param demand{D};
param arc_capacity; # maximum amount
param cost{A}; # unit shipping cost for each arc

# VARIABLES DEFINITION
var x{A}>=0; # for each arc, the amount of product passing through it

# OBJECTIVE FUNCTION
minimize total_cost: sum{i in A} cost[i]*x[i];

# CONSTRAINTS DEFINITION
subject to capacity{i in A}: x[i] <= arc_capacity;
subject to nodeA1: supply[1] <= x["AB"] + x["AC"];
subject to nodeA2: x["AB"] + x["AC"] <= supply[1];
subject to nodeB1: supply[2] + x["AB"] <= x["BC"] + x["BD"] + x["BE"];
subject to nodeB2: x["BC"] + x["BD"] + x["BE"] <= supply[2] + x["AB"];
subject to nodeC1: x["CE"] <= x["AC"] + x["BC"];
subject to nodeC2: x["AC"] + x["BC"] <= x["CE"];
subject to nodeD1: x["DE"] + x["DF"] <= x["BD"];
subject to nodeD2: x["BD"] <= x["DE"] + x["DF"];
subject to nodeE1: x["BE"] + x["CE"] + x["DE"] <= demand[1] + x["EF"];
subject to nodeE2: demand[1] + x["EF"] <= x["BE"] + x["CE"] + x["DE"];
subject to nodeF1: x["DF"] + x["EF"] <= demand[2];
subject to nodeF2: demand[2] <= x["DF"] + x["EF"];




