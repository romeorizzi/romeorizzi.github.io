# SETS
set WORKERS;
set OFFICES;
set DAYS;
# PARAMETERS
param priority{WORKERS,DAYS};
param nb_workers_allowed{OFFICES};
# VARIABLES
var x{WORKERS,OFFICES,DAYS}, binary;
var y{WORKERS,OFFICES}, binary;
# OBJECTIVE FUNCTION
maximize total_priority: sum{i in WORKERS, j in OFFICES, k in DAYS} priority[i,k]*x[i,j,k];
# CONSTRAINTS
subject to capacity_{j in OFFICES,k in DAYS}: sum{i in WORKERS} x[i,j,k] <= nb_workers_allowed[j];
subject to at_most_one_office{i in WORKERS,k in DAYS}: sum{j in OFFICES} x[i,j,k] <= 1;
subject to same_office_all_days{i in WORKERS}: sum{j in OFFICES} y[i,j] <= 1;
subject to binding{i in WORKERS, j in OFFICES, k in DAYS}: x[i,j,k] <= y[i,j];
