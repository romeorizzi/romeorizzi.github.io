set FLIGHTS;
set CLASSES;

param prices{CLASSES,FLIGHTS};
param nb_seats;
param nb_customers{CLASSES,FLIGHTS};

var x{CLASSES,FLIGHTS}, integer, >=0;

maximize revenue: sum{i in CLASSES, j in FLIGHTS} x[i,j]*prices[i,j];
subject to no_overbooking{i in CLASSES, j in FLIGHTS}: x[i,j] <= nb_customers[i,j];
subject to capacity{j in FLIGHTS}: sum{i in CLASSES} x[i,j] <= nb_seats;
