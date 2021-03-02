# SETS DEFINITION
set M; # set of substances
set N; # set of foods

# PARAMETERS DEFINITION
param amount_portion{M,N}; # amounts of substances for every portion of each food
param cost{N}; # cost of every portion of each food
param max_portions{N}; # maximum daily number of portions for each food 
param minimum_amount{M}; # minimum amounts of substances to reach daily

# VARIABLES DEFINITION
var x{N}>=0; # number of portions for each food
# OBJECTIVE FUNCTION
minimize total_cost: sum{i in N} cost[i] * x[i];
# CONSTRAINTS DEFINITION
subject to daily_necessities{i in M}: sum{j in N} amount_portion[i,j] * x[j] >= minimum_amount[i];
subject to max_number{i in N}: x[i] <= max_portions[i];







