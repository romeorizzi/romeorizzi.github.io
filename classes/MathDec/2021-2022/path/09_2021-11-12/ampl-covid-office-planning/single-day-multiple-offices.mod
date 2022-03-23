# SETS
set WORKERS;
set OFFICES;
# PARAMETERS
param priority{WORKERS};
param nb_workers_allowed{OFFICES};
# VARIABLES
var x{WORKERS,OFFICES}, binary; # x_{i,j} = 1 when worker i is allowed to go to office j; 0 otherwise

# OBJECTIVE FUNCTION
maximize total_priority: sum{i in WORKERS, j in OFFICES} priority[i]*x[i,j];

# CONSTRAINTS
subject to capacity{j in OFFICES}: sum{i in WORKERS} x[i,j] <= nb_workers_allowed[j];
subject to not_in_both{i in WORKERS}: sum{j in OFFICES} x[i,j] <= 1;