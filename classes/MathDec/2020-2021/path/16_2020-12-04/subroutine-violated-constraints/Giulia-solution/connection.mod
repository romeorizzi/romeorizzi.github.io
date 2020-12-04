set V ordered;
set E within {i in V, j in V: ord(i) < ord(j)};
param H1{E};	# good solution
param H2{E};	# good solution
param H3{E};	# good solution
param W{E};		# wrong solution

var c{E} >= 0, <= 1, integer; # vector 
var b, integer;

minimize Value_b: b;

subject to constraint_W: sum {(i,j) in E} c[i,j]*W[i,j] >=b+1;
subject to constraint_H1: sum {(i,j) in E} c[i,j]*H1[i,j] <=b;
subject to constraint_H2: sum {(i,j) in E} c[i,j]*H2[i,j] <=b;
subject to constraint_H3: sum {(i,j) in E} c[i,j]*H3[i,j] <=b;

/*
subject to constraint_W: sum {(i,j) in E} c[i,j]*W[i,j] <=b;
subject to constraint_H1: sum {(i,j) in E} c[i,j]*H1[i,j] >=b+1;
subject to constraint_H2: sum {(i,j) in E} c[i,j]*H2[i,j] >=b+1;
subject to constraint_H3: sum {(i,j) in E} c[i,j]*H3[i,j] >=b+1;
*/