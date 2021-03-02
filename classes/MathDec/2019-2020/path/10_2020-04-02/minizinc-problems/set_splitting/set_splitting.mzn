% Set Splitting
% MathDecisions 2020
% Department of Computer Science, University of Verona, Italy
% Matteo Zavatteri, March 2020

% PROBLEM DEFINITION: 
% INPUT: A finite set S and a collection C of subsets of S.
% OUTPUT: yes iff there exists a partition of S in two subsets S1 and S2 such that for each Ci in C, Ci is neither a subset of S1 nor S2
%

int: NS; % number of elements in S
int: NC; % number of elements in C

set of int: S = 1..NS;

array[1..NC] of set of S: C;


% S1,S2 is a partition of S
var set of S: S1;
var set of S: S2;

constraint(S1 union S2 = S);
constraint(S1 intersect S2 = {});

%for each C in S, C is not a subset of S1 nor S2
constraint(
  forall(Si in C)(not(Si subset S1) /\ not(Si subset S2))
);

solve satisfy;

output["S1=", show(S1), "\n"];
output["S2=", show(S2)];






  


