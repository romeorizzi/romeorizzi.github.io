% Set Packing
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: A collection C of finite sets and a positive integer K<=|C|
% OUTPUT: yes iff C contains at least K mutually disjoint sets
%

int: N; % number of sets in C
array[1..N] of set of int: C;
int: K;


var set of 1..N: S; % "selected"

% at least K sets are selected
constraint(card(S) >= K);

constraint(
  forall(i,j in S where i != j)(C[i] intersect C[j] = {})
);

solve satisfy;

output["S=", show(S)];






  


