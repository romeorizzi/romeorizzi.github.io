# SETS
set M; # set of nutrients
set N; # set of foods

# PARAMETERS
param amount_portion{M,N}; # amounts of nutrients for a portion of a given food
param cost{N}; # cost of a portion of a given food
param max_portions{N}; # maximum daily number of portions of a given food 
param minimum_amount{M}; # minimum amounts of nutrients to get daily

# VARIABLES
var x{N}>=0, integer; # number of portions of a given food
# OBJECTIVE FUNCTION
minimize total_cost: sum{i in N} cost[i] * x[i];
# CONSTRAINTS
subject to daily_necessities{i in M}: sum{j in N} amount_portion[i, j] * x[j] >= minimum_amount[i];
subject to max_number{i in N}: x[i] <= max_portions[i];







