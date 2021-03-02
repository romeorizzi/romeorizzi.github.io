param NB_DAYS integer > 0;
set DAYS := 1 .. NB_DAYS;
set SCHEDULES;
param required{DAYS};
param schedule_details{SCHEDULES, DAYS}, binary;

var x{SCHEDULES}, >= 0, integer;
minimize nb_employees: sum{i in SCHEDULES} x[i];
subject to required_day{j in DAYS}: sum{i in SCHEDULES} schedule_details[i,j]*x[i] >= required[j];
