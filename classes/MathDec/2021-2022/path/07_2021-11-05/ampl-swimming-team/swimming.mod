# SETS
set SWIMMERS;
set STYLES;

# PARAMETERS
param swimming_times{SWIMMERS,STYLES};

# VARIABLES
var x{SWIMMERS,STYLES} binary; # x_{i,j} = binary variables (or boolean) = 1 if swimmer i swims length j; 0 otherwise;

# OBJECTIVE FUNCTION
minimize total_time: sum{i in SWIMMERS, j in STYLES} swimming_times[i,j]*x[i,j];
#18*x_{JACK,BACK} + 20*x_{JACK,BREAST} + 19*x_{JACK,BUTTERFLY} + 14*x_{JACK,CRAWL}
#+..... + 15*x_{MIKE,CRAWL} --> min sum_ij (swimming_time[i,j]*x[i,j])

# CONSTRAINTS
subject to one_style_per_swimmer{i in SWIMMERS}: sum{j in STYLES} x[i,j] == 1;
# x_{JACK,BACK} + x_{JACK,BREAST} + x_{JACK,BUTTERFLY} + x_{JACK,CRAWL} = 1
# the same for all other swimmers
subject to one_swimmer_per_style{j in STYLES}: sum{i in SWIMMERS} x[i,j] == 1;
# x_{JACK,BACK} + x_{KYLE,BACK} + x_{LIAM,BACK} + x_{MIKE,BACK} = 1
# the same for all other lengths
   
   
  

