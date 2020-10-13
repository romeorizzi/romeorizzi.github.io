# SETS DEFINITION
set W; # set of different workouts

# PARAMETERS DEFINITION
param tolerance{W}; # tolerance of each workout
param calories_hour{W}; # calories per hour of each workout
param minimum_amount; # minimum amount of extra calories to burn off

# VARIABLES DEFINITION
var x{W}>=0; # for each workout, hours to do in a week
# OBJECTIVE FUNCTION
minimize total_hours: sum{i in W} x[i];
# CONSTRAINTS DEFINITION
subject to weekly_amount: sum{i in W} calories_hour[i]*x[i] >= minimum_amount;
subject to max_tolerance{i in W}: x[i] <= tolerance[i];







