# SETS
set WORKERS;
# PARAMETERS
param priority{WORKERS};
param nb_workers_allowed;
# VARIABLES
var x{WORKERS}, binary;
# OBJECTIVE FUNCTION
maximize total_priority: sum{i in WORKERS} priority[i]*x[i];
# CONSTRAINTS
subject to capacity: sum{i in WORKERS} x[i] <= nb_workers_allowed;