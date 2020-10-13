/*
File: production_ampl.mod	date: 14-November-2017	author: Alice Raffaele (alice.raffaele@unitn.it)
 - WARNING: this file cannot be used by itself but there are other two files in the package:
	production_ampl_dat.txt and production_ampl_run.txt */

# SETS DEFINITION
set S;
# PARAMETERS DEFINITION
param N; # periods of time (in this case, week)
param COST_PROD{1..N}; # cost production for a meter of glass fiber
param COST_WAREHOUSING{1..N}; # cost warehouse for a meter of glass fiber
param CAPACITY{1..N}; # capacity of the plant for each period of time
param DEMAND{1..N}; # demand for each period of time
# VARIABLES DEFINITION
var x{S} >= 0;
var y{S} >= 0;
# OBJECTIVE FUNCTION
minimize TotalCosts: sum{i in S}(COST_PROD[i] * x[i] + COST_WAREHOUSING[i] * y[i]); # minimize total costs
# CONSTRAINTS DEFINITION
subject to cap{i in S}: x[i] <= CAPACITY[i]; # quantity produced cannot exceed capacity, each week
subject to warehousing{i in 2..N}: y[i] = y[i-1] + x[i] - DEMAND[i]; # warehouse update
subject to initial_warehousing: y[1] = x[1] - DEMAND[1]; # warehousing the first week
