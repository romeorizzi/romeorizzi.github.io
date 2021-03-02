set V ordered;
set E within {i in V, j in V: ord(i) < ord(j)};
param cost{E};
#param c{E}; 		# resulting vector from the file "connection"

var x{E} >= 0, <= 1, binary;

minimize TourCost: sum {(i,j) in E} cost[i,j] * x[i,j];

subject to VisitAllVertices {i in V}: sum {(i,j) in E} x[i,j] + sum {(j,i) in E} x[j,i] = 2;
#subject to constraint_1: sum {(i,j) in E} c[i,j]*x[i,j] <=2;
#subject to constraint_2: sum {(i,j) in E} c[i,j]*x[i,j] >=1;