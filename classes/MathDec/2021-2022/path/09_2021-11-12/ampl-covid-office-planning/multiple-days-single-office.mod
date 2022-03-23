# SETS
set WORKERS;
set DAYS;
# PARAMETERS
param priority{WORKERS,DAYS};
param nb_workers_allowed{DAYS};
# VARIABLES
var x{WORKERS,DAYS}, binary; # x_{i,j} = 1 when worker i is allowed to go to the office on day j
# OBJECTIVE FUNCTION
maximize total_priority: sum{i in WORKERS, j in DAYS} priority[i,j]*x[i,j];
# CONSTRAINTS
subject to capacity{j in DAYS}: sum{i in WORKERS} x[i,j] <= nb_workers_allowed[j];