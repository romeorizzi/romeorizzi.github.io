# SETS
set WORKERS;
set OFFICES;
set DAYS;
# PARAMETERS
param priority{WORKERS,DAYS};
param nb_workers_allowed{OFFICES,DAYS};

# VARIABLES
var x{WORKERS,OFFICES,DAYS}, binary; # x_{i,j,k} = 1 when worker i is allowed to go to office j on day k

# OBJECTIVE FUNCTION
maximize total_priority: sum{i in WORKERS, j in OFFICES, k in DAYS} priority[i,k]*x[i,j,k];

# CONSTRAINTS
subject to capacity{j in OFFICES, k in DAYS}: sum{i in WORKERS} x[i,j,k] <= nb_workers_allowed[j,k];
subject to not_in_both{i in WORKERS, k in DAYS}: sum{j in OFFICES} x[i,j,k] <= 1; 