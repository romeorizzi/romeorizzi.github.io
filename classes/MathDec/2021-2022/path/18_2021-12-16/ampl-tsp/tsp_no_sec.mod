set V ordered;
set E within {i in V, j in V: ord(i) < ord(j)};
param cost{E};
var X{E} binary;
minimize TourCost: sum {(i,j) in E} cost[i,j] * X[i,j];
subject to VisitAllVertices {i in V}:
   sum {(i,j) in E} X[i,j] + sum {(j,i) in E} X[j,i] = 2;