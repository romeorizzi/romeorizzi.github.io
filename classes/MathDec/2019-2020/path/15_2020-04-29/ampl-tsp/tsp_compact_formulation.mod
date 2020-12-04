/*
May 2019 - This GMPL model was created by Alice Raffaele (alice.raffaele@unitn.it) for didactical purposes.

ASYMMETRIC TRAVELING SALESMAN PROBLEM (ATSP)
Input: a directed graph G(V,A), a weight function w: A -> R+;
Output: an Hamiltonian cycle which visits all the vertices exactly once.

This model implements the Miller, Tucker and Zemlin's compact formulation for the ATSP,
enhanced by Sawik. For details see: 

"A note on the Miller-Tucker-Zemlin model
for the asymmetric traveling salesman problem"
T.J. Sawik
January 2016
DOI: 10.1515/bpasts-2016-0057

Instead of introducing an exponential number of constraints to avoid subtours in the solutions,
using for instance Dantzig, Fulkerson and Johnson's formulation,
Miller, Tucker and Zemlin propose to give an ordering to all nodes.
They assume that the tour starts from the first element in the set of vertices.
O(n^2) constraints are produced.
*/

set V; # V(G) set of vertices
set A within {i in V, j in V}; # A(G) set of arcs

param n; # number of vertices
param w{A}; # weight function, one value for each arc in the graph

var x{i in V, j in V} binary; # x[i,j] = 1 if the corresponding arc is taken in the solution, 0 otherwise
var u{V}, <= n; # a position variable for each vertex, indicating the order of visit during the tour (at most n)

# objective function
minimize TourCost: sum {(i,j) in A} w[i,j] * x[i,j];

# constraints:
subject to NotArcs{i in V, j in V: (i,j) not in A}: # the variables associated to arcs not in A assume the value zero 
	x[i,j] = 0;
subject to OnlyOneExiting{i in V}: # from each vertex, only one outgoing arc is selected
	sum{(i,j) in A: i <> j} x[i,j] = 1;
subject to OnlyOneIncoming{j in V}: # to each vertex, only one incoming arc is selected
	sum{(i,j) in A: i <> j} x[i,j] = 1;
subject to Either{i in V, j in V: i <> j}: # the tour may contain either arc x[i,j] or x[j,i] or none of them
	x[i,j] + x[j,i] <= 1;
subject to MillerTuckerZemlin{i in V, j in V: i > 1 and j > 1 and i <> j}: # position constraints
	u[i] - u[j] + n*x[i,j] + (n-2)*x[j,i] <= n-1;
subject to InitialPosition: # the first vertex has position 1
	u[1] = 1;
subject to PositionsLB{i in V: i >= 2}: # LB on the positions of other vertices
	u[i] >= 2;