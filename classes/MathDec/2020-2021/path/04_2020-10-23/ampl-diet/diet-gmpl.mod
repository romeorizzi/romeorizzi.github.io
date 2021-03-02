/* THE DIET PROBLEM */
set M;
/* nutrients */

set N;
/* foods */

param minimum_amount{M};
/* minimum amounts of nutrients to get daily */

param amount_portion{M,N};
/* amounts of nutrients for a portion of a given food */

param cost{N};
/* cost of a portion of a given food */

param max_portions{N};
/* maximum daily number of portions of a given food */

var x{n in N} >= 0;
/* number of portions of a given food */

s.t. daily_necessities{i in M}: sum{j in N} amount_portion[i, j] * x[j] >= minimum_amount[i];
s.t. max_number{i in N}: x[i] <= max_portions[i];
/* constraints */

minimize total_cost: sum{i in N} cost[i] * x[i];
/* total cost (euro) */

data;

set M := CALORIES PROTEIN CALCIUM;
set N := BREAD MILK EGGS MEAT SWEETS;

param amount_portion : BREAD MILK EGGS MEAT SWEETS :=
CALORIES 150 120 160 230 450
PROTEIN 4 8 15 14 4
CALCIUM 2 285 54 80 22;

param cost :=
BREAD 3
MILK 2
EGGS 3
MEAT 19
SWEETS 15;

param max_portions :=
BREAD 4
MILK 7
EGGS 2
MEAT 3
SWEETS 2;

param minimum_amount :=
CALORIES 2000
PROTEIN 50
CALCIUM 700;

end;
