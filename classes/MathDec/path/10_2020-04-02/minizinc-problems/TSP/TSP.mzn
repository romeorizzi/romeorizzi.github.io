% TSP
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: A set C of N cities, a positive integer B and a distance matrix D NxN 
%        where each D[i,j] is a postive integer containing the distance to go from city i to city j.
% OUTPUT: yes iff there exists an injection f:{1,..,N}->C such that: (sum_{i=1,..N-1}(D[f(i),f(i+1)]) + D[f(N),f(1)]) <= B
%

% Graph G

int: N;
array[1..N,1..N] of int: D;
int: B;

array[1..N] of var 1..N: f;

% f is an injection
constraint(
  forall(i,j in 1..N where i != j)(f[i] != f[j])
);

% global distance of tour <= B
constraint(
  (sum(i in 1..(N-1))(D[f[i],f[i+1]]) + D[f[N],f[1]]) <= B
);

solve satisfy;

output["f=", show(f)];






  


