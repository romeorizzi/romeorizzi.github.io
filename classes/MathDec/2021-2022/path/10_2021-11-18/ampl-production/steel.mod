set PRODUCTS;
param rate{PRODUCTS}; #tons/h
param profit{PRODUCTS}; # dollars/ton
param ub{PRODUCTS}; # tons
param nb_hours;

var x{PRODUCTS}, >=0;

maximize total_profit: sum{i in PRODUCTS} x[i]*profit[i];
subject to production_time: sum{i in PRODUCTS} x[i]/rate[i] <= nb_hours;
subject to upper_bounds{i in PRODUCTS}: x[i] <= ub[i];